# frozen_string_literal: true

require 'uri'
require 'net/https'
require 'net/http'
require 'json'
require 'awesome_print'

class ApplicationController < Sinatra::Base
  configure :production, :development do
    enable :logging
  end

  set :public_folder, 'public'
  set :views, File.expand_path(File.join(__FILE__, '../../views'))

  get '/' do
    @resume_service = ResumeService.new
    analyzer = AnalyzerService.new(request)
    logger.info analyzer.report

    unless ResumeValidator.new(@resume_service).valid?
      status :bad_request
      logger.error 'Validation error'
      body 'Unexpected error. Please try again'
    end

    MailerService.send_notification(analyzer.report)
    erb :index
  rescue StandardError => e
    status :bad_request
    logger.error e
  end
end

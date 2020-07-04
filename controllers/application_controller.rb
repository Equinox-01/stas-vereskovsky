# frozen_string_literal: true

require 'uri'
require 'net/https'
require 'net/http'
require 'json'
require 'awesome_print'

class ApplicationController < Sinatra::Base
  set :public_folder, 'public'
  set :views, File.expand_path(File.join(__FILE__, '../../views'))

  get '/' do
    begin
      @resume_service = ResumeService.new
      analyzer = AnalyzerService.new(request)

      unless ResumeValidator.new(@resume_service).valid?
        status :bad_request
        body 'One or more fields in JSON-file is invalid'
      end

      MailerService.send_notification(analyzer.report)
      erb :index
    rescue StandardError
      status :bad_request
      body 'Damaged JSON-file'
    end
  end
end

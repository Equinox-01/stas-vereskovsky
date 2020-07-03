# frozen_string_literal: true

require 'uri'
require 'net/https'
require 'net/http'
require 'json'

class ApplicationController < Sinatra::Base
  set :public_folder, 'public'
  set :views, File.expand_path(File.join(__FILE__, '../../views'))

  get '/' do
    @current_year = Time.new.year
    begin
      @resume_service = ResumeService.new
      erb :index
    rescue StandardError
      status :not_found
    end
  end
end

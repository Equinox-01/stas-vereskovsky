# frozen_string_literal: true

require 'uri'
require 'net/https'
require 'net/http'

class ApplicationController < Sinatra::Base
  set :public_folder, 'public'
  set :views, File.expand_path(File.join(__FILE__, '../../views'))

  get '/' do
    erb :index
  end
end

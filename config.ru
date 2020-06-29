$:.unshift File.expand_path("../", __FILE__)
require 'sinatra/base'

Dir["./services/*.rb"].each { |file| require file }
Dir["./controllers/*.rb"].each { |file| require file }

run ApplicationController
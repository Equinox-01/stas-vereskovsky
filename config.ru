# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path(__dir__)
require 'sinatra/base'

Dir['./services/*.rb'].sort.each { |file| require file }
Dir['./validators/*.rb'].sort.each { |file| require file }
Dir['./decorators/*.rb'].sort.each { |file| require file }
Dir['./controllers/*.rb'].sort.each { |file| require file }

run ApplicationController

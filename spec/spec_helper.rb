require 'rubygems'
require 'bundler/setup'
require 'rspec'

require 'logging_connection'

def create_connection
  return LoggingConnection.new
end
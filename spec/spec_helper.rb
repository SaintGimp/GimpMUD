require 'rubygems'
require 'bundler/setup'
require 'rspec'

require 'logging_connection'
require 'custom_matchers'

require_relative '../world'

def create_connection
  return LoggingConnection.new
end

def login(name)
  connection = LoggingConnection.new
  connection.receive "login #{name}"
  return World.find_player name
end
require 'rubygems'
require 'bundler/setup'
require 'rspec'

require_relative '../lib/load_paths'

require 'logging_connection'
require 'custom_matchers'

require 'game_objects/world'
require 'game_objects/room'

RSpec.configure do |config|
  config.before(:each) do
    World.build_sample
  end
end

def create_connection
  return LoggingConnection.new
end

def login(name)
  connection = LoggingConnection.new
  connection.receive("login #{name}")
  connection.clear_log
  return World.find_player(name)
end
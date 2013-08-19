require 'rubygems'
require 'bundler/setup'
require 'rspec'

require_relative '../lib/load_paths'

require 'logging_connection'
require 'custom_matchers'

require 'world'
require 'room'

module World
  module_function
  def build
    @objects.clear

    add(Room.new(0, 'A forest', 'The verdant trees tower above you.'))
  end
end

RSpec.configure do |config|
  config.before(:each) do
    World.build
  end
end

def create_connection
  return LoggingConnection.new
end

def login(name)
  connection = LoggingConnection.new
  connection.receive "login #{name}"
  connection.clear_log
  return World.find_player name
end
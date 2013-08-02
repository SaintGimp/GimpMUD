require 'rubygems'
require 'bundler/setup'
require 'pry'

require './connection'

class Server
  def initialize(connection = Connection.new)
    @connection = connection
  end

  def run
    loop do
      print '> '
      input = gets.chomp
      @connection.receive input
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  server = Server.new
  server.run
end
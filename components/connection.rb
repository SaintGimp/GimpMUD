require 'command_parser'

class Connection
  attr_reader :player
  attr_accessor :id

  def initialize
    @command_parser = CommandParser.new
  end

  def receive(data)
    @command_parser.parse self, data
  end

  def send_output(text)
    puts "#{@id}: #{text}"
  end

  def attach_player(player)
    @player = player
  end
end

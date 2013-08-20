require 'commands/command_parser'

class Connection
  attr_reader :player
  attr_accessor :id

  def initialize
    @command_parser = CommandParser.new
  end

  def receive(data)
    @command_parser.parse(self, data)

    # TODO: this is kind of a random place to put this but it saves us
    # having to sprinkle this line all through the specs. Is there a
    # better place for it?
    World.process_events
  end

  def send_output(*output)
    output.flatten.each do |text|
      puts "#{@id}: #{text}"
    end
  end

  def attach_player(player)
    @player = player
  end
end

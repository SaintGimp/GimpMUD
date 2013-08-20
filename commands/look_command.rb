require 'events/looked'

module Commands
  class LookCommand
    attr_reader :name

    def initialize
      @name = 'LOOK'
    end

    def try_to_handle(connection, input)
      if /^look$/i =~ input
        event = Events::Looked.new(connection.player)
        World.send_event(event)
        return true
      else
        return false
      end
    end
  end
end
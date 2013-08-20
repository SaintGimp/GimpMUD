require 'events/said'

module Commands
  class SayCommand
    attr_reader :name

    def initialize
      @name = 'SAY'
    end

    def try_to_handle(connection, input)
      if /^say\s+?(.*)$/i =~ input
        actor = connection.player
        event = Events::Said.new(actor, Regexp.last_match(1))
        World.send_event(event)
        return true
      else
        return false
      end
    end
  end
end
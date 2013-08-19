module Events
  class LookEvent
    attr_reader :actor

    def initialize(actor)
      @actor = actor
    end
  end
end
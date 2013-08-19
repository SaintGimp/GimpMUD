module Events
  class SayEvent
    attr_reader :actor
    attr_reader :text

    def initialize(actor, text)
      @actor = actor
      @text = text
    end
  end
end

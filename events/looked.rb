module Events
  class Looked
    attr_reader :actor

    def initialize(actor)
      @actor = actor
    end
  end
end
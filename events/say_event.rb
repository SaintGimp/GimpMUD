module Events
  class SayEvent
    attr_reader :speaker
    attr_reader :text

    def initialize(speaker, text)
      @speaker = speaker
      @text = text
    end
  end
end

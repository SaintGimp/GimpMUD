class LoggingConnection < Connection
  attr_reader :log

  def initialize
    @log = []
  end
  
  def send(text)
    super text
    @log << text
  end
end
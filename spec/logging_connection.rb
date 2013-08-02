require_relative '../connection'

class LoggingConnection < Connection
  attr_reader :log

  def initialize
    @log = []
  end

  def send(text)
    @log << text
  end
end
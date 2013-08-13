require 'connection'

class LoggingConnection < Connection
  attr_reader :log

  def initialize
    super
    @log = []
  end

  def send_output(text)
    @log << text
  end
end
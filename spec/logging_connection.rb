require 'components/connection'

class LoggingConnection < Connection
  attr_reader :log

  def initialize
    super
    @log = []
  end

  def send_output(output)
    @log.push(*output)
  end

  def clear_log
    @log.clear
  end
end
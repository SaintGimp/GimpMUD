class Player
  attr_reader :connection
  attr_reader :name

  def initialize(connection, name)
    @connection = connection
    @name = name
  end

  def send_output(text)
    connection.send_output text
  end
end
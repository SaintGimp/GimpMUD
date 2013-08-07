class CommandParser
  def initialize
    # TODO: do this only once
    Dir["#{__dir__}/commands/*.rb"].each { |file| load file }
    command_classes = Commands.constants.map(&Commands.method(:const_get)).grep(Class)
    @commands = command_classes.map { |commandClass| commandClass.new }
  end

  def parse(connection, input)
    return nil if input.nil?

    input = input.strip
    return nil if input.empty?

    handled = false
    @commands.each do |command|
      handled = command.try_to_handle(connection, input)
      break if handled
    end

    connection.send_output "I don't understand that." unless handled
  end
end
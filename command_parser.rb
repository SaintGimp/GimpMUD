class CommandParser
  def initialize
    # TODO: do this only once
    Dir["#{__dir__}/commands/*.rb"].each { |file| load file }
    command_classes = Commands.constants.map(&Commands.method(:const_get)).grep(Class)
    @commands = command_classes.map { |commandClass| commandClass.new }
    @commands << self
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

  def try_to_handle(connection, input)
    if /^help$/i =~ input
      connection.send_output 'Available commands:'

      real_commands = @commands.reject { |command| command == self }
      real_commands.sort_by! { |command| command.name }
      real_commands.each do |command|
        connection.send_output command.name
      end
      return true
    else
      return false
    end
  end
end
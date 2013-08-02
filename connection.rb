class Connection
  def receive(data)
    return nil if data.nil?

    input = data.strip
    return nil if input.empty?

    case input
    when /^say\s+?(.*)$/i
      send "You say, \"#{$1}\""
    else
      send "I don't understand that."
    end
  end

  def send(text)
    puts text
  end
end

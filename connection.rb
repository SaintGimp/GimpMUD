class Connection
  def receive(data)
    send(data)
  end

  def send(text)
    puts text
  end
end

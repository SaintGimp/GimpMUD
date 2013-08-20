describe 'LOGIN command' do
  it 'logs in the player' do
    connection = create_connection
    connection.receive('login Alice')
    alice = World.find_player('Alice')

    expect(World.objects).to include be_player('Alice')
    expect(alice.connection).to_not be_nil
    expect(alice.connection.player).to be(alice)
    expect(alice.connection.log).to include 'Logged in as Alice'
  end

  it 'automatically looks at the room the player starts in' do
    connection = create_connection
    connection.receive('login Alice')

    expect(connection.log).to include 'The verdant trees tower above you.'
  end
end


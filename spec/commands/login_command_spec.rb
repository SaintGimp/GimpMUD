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

    expect(connection.log).to include 'A forest'
  end

  it 'shows the login message before the room message' do
    connection = create_connection
    connection.receive('login Alice')

    expect(connection.log.find_index('Logged in as Alice')).to be < connection.log.find_index('A forest')
  end

  it 'should not send a looked message to other players' do
    alice = login('Alice')
    connection = create_connection
    connection.receive('login Bob')

    # TODO: we need a better way to determine whether output was sent
    # or not, not dependent on exact language.
    expect(alice.connection.log).not_to include match(/looks around/i)
  end
end


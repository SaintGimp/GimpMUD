describe 'LOGIN command' do
  it 'logs in the player' do
    connection = create_connection
    connection.receive 'login Alice'
    alice = World.find_player 'Alice'

    expect(World.objects).to include(be_player('Alice'))
    expect(alice.connection).to_not be_nil
    expect(alice.connection.player).to be(alice)
    expect(alice.connection.log).to include('Logged in as Alice')
  end
end


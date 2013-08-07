describe 'LOGIN command' do
  it 'logs in the player' do
    alice = login 'Alice'

    expect(World.objects).to include(be_player('Alice'))
    expect(alice.connection).to_not be_nil
    expect(alice.connection.player).to be(alice)
    expect(alice.connection.log).to include('Logged in as Alice')
  end
end


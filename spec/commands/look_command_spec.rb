describe 'LOOK command' do
  it 'shows the name of the room' do
    alice = login 'Alice'

    alice.connection.receive 'look'

    expect(alice.connection.log).to include('A forest')
  end
end

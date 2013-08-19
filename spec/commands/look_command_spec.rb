describe 'LOOK command' do
  it 'shows the name of the room' do
    alice = login 'Alice'

    alice.connection.receive 'look'

    expect(alice.connection.log).to include('A forest')
  end

  it 'shows the description of the room' do
    alice = login 'Alice'

    alice.connection.receive 'look'

    expect(alice.connection.log).to include('The verdant trees tower above you.')
  end
end

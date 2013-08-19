describe 'SAY command' do
  it 'shows the user what they said' do
    alice = login 'Alice'

    alice.connection.receive 'say Hello world!'

    expect(alice.connection.log).to include('You say, "Hello world!"')
  end

  it 'shows other users what they said' do
    alice = login 'Alice'
    bob = login 'Bob'

    alice.connection.receive 'say Hello world!'

    expect(bob.connection.log).to include('Alice says, "Hello world!"')
  end
end


describe 'HELP command' do
  it 'displays a list of commands' do
    alice = login('Alice')
    alice.connection.receive('help')

    expect(alice.connection.log).to include match(/login/i)
    expect(alice.connection.log).to include match(/say/i)
  end
end
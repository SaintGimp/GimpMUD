require_relative '../connection'

describe 'SAY command' do
  it 'should show the user what they said' do
    connection = create_connection
    connection.receive 'say Hello world!'

    expect(connection.log).to include('You say, "Hello world!"')
  end
end


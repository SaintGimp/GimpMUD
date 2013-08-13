require 'connection'

describe 'Command processing' do
  it 'informs the user if the command is unknown' do
    connection = create_connection
    connection.receive 'blahblahblah'

    expect(connection.log).to include(match(/don't understand/))
  end

  it 'recognizes commands regardless of case' do
    connection = create_connection
    connection.receive 'sAy Hi'

    expect(connection.log).to include(match(/Hi/))
  end

  it 'ignores leading whitespace' do
    connection = create_connection
    connection.receive ' say Hi'

    expect(connection.log).to include(match(/Hi/))
  end

  it 'ignores empty input' do
    connection = create_connection
    connection.receive ''

    expect(connection.log).to be_empty
  end
end
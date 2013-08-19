require 'connection'

describe 'Command processing' do
  it 'informs the user if the command is unknown' do
    alice = login 'Alice'
    alice.connection.receive 'blahblahblah'

    expect(alice.connection.log).to include(match(/don't understand/))
  end

  it 'recognizes commands regardless of case' do
    alice = login 'Alice'
    alice.connection.receive 'sAy Hi'

    expect(alice.connection.log).to include(match(/Hi/))
  end

  it 'ignores leading whitespace' do
    alice = login 'Alice'
    alice.connection.receive ' say Hi'

    expect(alice.connection.log).to include(match(/Hi/))
  end

  it 'ignores empty input' do
    alice = login 'Alice'
    alice.connection.receive ''

    expect(alice.connection.log).to be_empty
  end
end
require 'rspec'

describe 'Getting input' do
  it "should echo all input to the user" do
    connection = create_connection
    connection.receive 'Hello world!'

    expect(connection.log).to include('Hello world!')
  end
end


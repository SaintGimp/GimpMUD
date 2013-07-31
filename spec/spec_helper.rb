require_relative '../server'
require_relative '../connection'

require 'logging_connection'

def create_connection
  return LoggingConnection.new
end
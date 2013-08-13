require 'rspec/expectations'
require 'player'

RSpec::Matchers.define :be_player do |expected|
  match do |actual|
    actual.kind_of?(Player) && actual.name == expected
  end
end
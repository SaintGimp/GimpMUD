require 'rspec/expectations'
require 'game_objects/player'

RSpec::Matchers.define :be_player do |expected|
  match do |actual|
    actual.kind_of?(Player) && actual.name == expected
  end
end
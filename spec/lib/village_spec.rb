require 'rspec'
require 'colorize'

require_relative '../../lib/building'
require_relative '../../lib/infrastructure'
require_relative '../../lib/village'

describe Village do
  before(:each) do
    @village = Village.new
    @village.infrastructure.build(type: :living_home, size: :big)
    @village.infrastructure.build(type: :living_home, size: :big)
    @village.infrastructure.build(type: :living_home, size: :middle)
  end

  it "get right information from building" do
    @village.happines.should == 75
  end
end

require 'rspec'

require_relative '../../lib/building'

describe Building do
  it "get right information from building" do
    building = Building.new(name: 'Input name', size: :middle, influence: :big, type: :produce)
    building.info.should == "       Input name: Size: Middle home | Type: Produce | Influence: big\n"
  end

  it "get right information from building" do
    building = Building.new
    building.info.should == "       Building 2: Size: Small home | Type: Living Home | Influence: small\n"
  end

end

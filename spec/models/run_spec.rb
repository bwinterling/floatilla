require 'spec_helper'

describe Run do
  before :each do
    @river = FactoryGirl.create :river
    @run = FactoryGirl.create(:run, :river_id => @river.id )
  end

  it "belongs to a river" do
    expect(@river.runs.first.name).to eq("Little Cub Run")
  end
end

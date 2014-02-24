require 'spec_helper'

describe Gauge do
  context "creating a new gauge" do

    context "with valid params" do
      it "creates a gauge" do
        FactoryGirl.build(:gauge).should be_valid
      end

      it "is associated with a run" do
        river = FactoryGirl.create :river
        run = FactoryGirl.create :run, :river_id => river.id
        FactoryGirl.create :gauge, :run_id => run.id
        expect(run.gauges.first.name).to eq("Fast Run")
      end
    end

    context "with invalid params" do
      it "does not create gauge without a name" do
        FactoryGirl.build(:gauge, :name => "").should_not be_valid
      end

      it "does not create gauge without a lat" do
        FactoryGirl.build(:gauge, :lat => nil).should_not be_valid
      end

      it "does not create gauge without a long" do
        FactoryGirl.build(:gauge, :long => nil).should_not be_valid
      end

      it "does not create gauge with invalid lat" do
        FactoryGirl.build(:gauge, :lat => 200).should_not be_valid
        FactoryGirl.build(:gauge, :lat => -200).should_not be_valid
      end

      it "does not create gauge with invalid long" do
        FactoryGirl.build(:gauge, :long => 200).should_not be_valid
        FactoryGirl.build(:gauge, :long => -200).should_not be_valid
      end
    end

  end
end

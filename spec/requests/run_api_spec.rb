require 'spec_helper'

describe "Runs API" do

  before :each do
    @accept_format = {"Accept" => "application/json"}
  end

  describe "GET /api/v1/rivers/:river_id/runs" do
    it "returns all the associated runs" do
      river = FactoryGirl.create :river, :name => "Black Hawk"
      FactoryGirl.create :run, :river_id => river.id, :name => "fun jog"
      FactoryGirl.create :run, :river_id => river.id, :name => "fast run"

      get "api/v1/rivers/#{river.id}/runs", {}, @accept_format

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      run_names = body.map {|run| run["name"]}
      expect(run_names).to match_array(["fun jog", "fast run"])
    end
  end
end


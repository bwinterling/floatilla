require 'spec_helper'

describe "Gauges API" do

  before :each do
    @accept_format = {"Accept" => "application/json"}
  end

  describe "GET /api/v1/gauges" do
    it "returns all the gauges" do
      first_gauge = FactoryGirl.build :gauge, :name => "firsties"
      second_gauge = FactoryGirl.build :gauge, :name => "secondsies"

      get "/api/v1/gauges", {}, @accept_format

      body = JSON.parse(response.body)

      gauge_names = body.map {|gauge| gauge["properties"]["title"]}
      expect(gauges_names).to match_array(["firsties", "secondsies"])

      gauage_types = body.map {|gauge| gauge["geometry"]["type"]}
      expect(gauges_types).to match_array(["Point", "Point"])
    end
  end

end

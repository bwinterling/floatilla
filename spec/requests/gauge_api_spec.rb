require 'spec_helper'

describe "Gauges API" do

  before :each do
    @accept_format = {"Accept" => "application/json"}
  end

  describe "GET /api/v1/gauges" do
    it "returns all the gauges in valid geo_json" do
      first_gauge = FactoryGirl.create :gauge, :name => "firsties"
      second_gauge = FactoryGirl.create :gauge, :name => "secondsies"

      get "/api/v1/gauges", {}, @accept_format

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      gauge_names = body.map {|gauge| gauge["properties"]["title"]}
      expect(gauge_names).to match_array(["firsties", "secondsies"])

      gauge_types = body.map {|gauge| gauge["geometry"]["type"]}
      expect(gauge_types).to match_array(["Point", "Point"])

      coords = body.map {|gauge| gauge["geometry"]["coordinates"]}
      expect(coords).to match_array([ ["50.02","100.01"], ["50.02","100.01"] ])

      marker_colors = body.map {|gauge| gauge["properties"]["marker-color"]}
      expect(marker_colors).to match_array(["#fc4353", "#fc4353"])

      marker_sizes = body.map {|gauge| gauge["properties"]["marker-size"]}
      expect(marker_sizes).to match_array(["large", "large"])

      marker_symbols = body.map {|gauge| gauge["properties"]["marker-symbol"]}
      expect(marker_symbols).to match_array(["monument", "monument"])
    end
  end

end

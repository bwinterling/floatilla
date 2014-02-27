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

      marker_sizes = body.map {|gauge| gauge["properties"]["marker-size"]}
      expect(marker_sizes).to match_array(["large", "large"])
    end
  end

  describe "GET /api/v1/gauges?run_id=:run_ids" do
    before :each do
      FactoryGirl.create(:gauge, :name => "Flatlands", :run_id => 42)
      FactoryGirl.create(:gauge, :name => "Badlands", :run_id => 42)
      FactoryGirl.create(:gauge, :name => "Boogeylands", :run_id => 1)
      FactoryGirl.create(:gauge, :name => "Waterful", :run_id => 3)
    end

    it "returns the gauges associated with a specified run" do
      get "/api/v1/gauges?run_id=42", {}, @accept_format

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      gauge_names = body.map {|gauge| gauge["properties"]["title"] }
      expect(gauge_names).to match_array(["Flatlands", "Badlands"])
    end


    it "returns the gauges associated with specified runs" do
      get "/api/v1/gauges?run_id=42,1", {}, @accept_format

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      gauge_names = body.map {|gauge| gauge["properties"]["title"] }
      expect(gauge_names).to match_array(["Flatlands", "Badlands", "Boogeylands"])
    end


  end

end

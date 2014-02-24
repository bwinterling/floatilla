require 'spec_helper'

describe "Rivers API" do

  before :each do
    @accept_format = {"Accept" => "application/json"}
  end

  describe "GET /api/v1/rivers" do
    it "returns all the rivers in valid json" do
      FactoryGirl.create :river, :name => "Black Hawk"
      FactoryGirl.create :river, :name => "Brown Bear"

      get "api/v1/rivers", {}, @accept_format

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      river_names = body.map {|river| river["name"]}

      expect(river_names).to match_array(["Black Hawk", "Brown Bear"])
    end
  end

  describe "GET /api/v1/rivers/:river_id" do
    it "returns the specified river" do
      river = FactoryGirl.create :river, :name => "Black Hawk"

      get "api/v1/rivers/#{river.id}", {}, @accept_format
      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      river_name = body["name"]

      expect(river_name).to eq("Black Hawk")
    end
  end
end

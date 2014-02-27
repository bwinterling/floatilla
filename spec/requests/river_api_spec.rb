require 'spec_helper'

describe "Rivers API" do

  before :each do
    @accept_format = {"Accept" => "application/json"}
  end

  describe "GET /api/v1/rivers" do
    describe "with no params" do
      it "returns all the rivers in valid json" do
        River.destroy_all # :TODO: :fixme:
        FactoryGirl.create :river, :name => "Black Hawk"
        FactoryGirl.create :river, :name => "Brown Bear"

        get "api/v1/rivers", {}, @accept_format

        expect(response.status).to eq 200

        body = JSON.parse(response.body)

        river_names = body.map {|river| river["name"]}

        expect(river_names).to match_array(["Black Hawk", "Brown Bear"])
      end
    end

    describe "with filtering params" do
      21.times do |i|
        FactoryGirl.create :river, :name => "Black #{i}"
      end
      it "with limit=10, returns first 10 entries" do
        get "/api/v1/rivers.json?offset=0&limit=10", {}, @accept_format
        expect(response.status).to eq 200
        body = JSON.parse(response.body)
        rivers_count = body.count
        expect(rivers_count).to eq 10
      end
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

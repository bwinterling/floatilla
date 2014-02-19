require 'spec_helper'

describe GaugesController do
  describe "GET #index" do
    it "loads all of the gauges into @gauges" do
      gauge1 = FactoryGirl.create :gauge
      gauge2 = FactoryGirl.create :gauge

      get :index

      expect(assigns(:gauges)).to match_array([gauge1, gauge2])
    end
  end
end

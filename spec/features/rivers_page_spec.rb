require 'spec_helper'

describe "rivers page" do

  it "displays a listing of available rivers" do
    visit "/rivers"
    within "#rivers" do
      expect(page).to have_content("Bear River")
    end

  end
end

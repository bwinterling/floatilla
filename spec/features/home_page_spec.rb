require 'spec_helper'

describe "home page" do
  it "displays Floatilla in the header" do
    visit "/"
    within "h1" do
      expect(page).to have_content("Floatilla")
    end
  end
end

require 'spec_helper'

describe "rivers show page" do

  before :each do
    @river = FactoryGirl.create :river, name: "Roaring Spoon"
  end

  it "displays the river's name" do
    visit "/rivers/#{@river.id}"
    expect(page).to have_content(@river.name)
  end
end

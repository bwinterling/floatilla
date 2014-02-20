require 'spec_helper'

describe "rivers page" do

  before :each do
    @river = FactoryGirl.create :river
  end

  it "displays a listing of available rivers" do
    visit "/rivers"
    expect(page).to have_content(@river.name)
  end
end

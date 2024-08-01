require "rails_helper"

RSpec.describe "Search" do
  before(:each) do
    visit search_index_path
  end

  it "can search for units by with faction drop down" do
    expect(page).to_not have_css(".results")

    within("#factions") do
      select "Necrons", :from => :faction_id
      click_button("Search For Units")
    end

    expect(page).to have_css(".results")

    within(".unit-cards") do
      expect(page).to have_css(".name")
      expect(page).to have_css(".weapon")
      expect(page).to have_selector("input[type=radio][name=attacker]")
      expect(page).to have_selector("input[type=radio][name=defender]")
    end

    expect(page).to have_button("Submit")
  end
end
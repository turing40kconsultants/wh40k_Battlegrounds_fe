require "rails_helper"

RSpec.describe "dashboard" do
  before(:each) do
    visit dashboard_path
  end

  it "can see link to search for units and will not see start fight link until 2 units are chosen" do
    expect(page).to have_content("Welcome to Warhammer 40k Battlegrounds")

    expect(page).to_not have_css(".player")
    expect(page).to_not have_css(".opponent")

    expect(page).to have_link("Choose Units", href: search_index_path)
    expect(page).to_not have_link("Start Fight", href: battle_index_path)

    click_link("Choose Units")

    expect(page).to have_current_path(search_index_path)
    
    within("#factions") do
      select "Necrons", :from => :faction_id
      click_button("Search For Units")
    end

    within("#unit_1") do
      choose("player")
    end
    within("#unit_2") do
      choose("opponent")
    end

    click_button("Submit")
# save_and_open_page
    expect(page).to have_css(".player")
    expect(page).to have_css(".opponent")
    expect(page).to have_link("Start Fight")
  end
end
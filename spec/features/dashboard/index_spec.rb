require "rails_helper"

RSpec.describe "dashboard" do
  before(:each) do
    visit dashboard_path


  end

  it "can see link to search for units and will not see start fight link until 2 units are chosen" do
    expect(page).to have_content("Welcome to Warhammer 40k Battlegrounds")

    expect(page).to_not have_css(".player1")
    expect(page).to_not have_css(".player2")

    expect(page).to have_link("Choose Units", href: search_index_path)
    expect(page).to_not have_link("Start Fight", href: battle_index_path)

    click_link{"Choose Units"}
  end
end
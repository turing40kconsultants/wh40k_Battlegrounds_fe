require "rails_helper"

RSpec.describe "dashboard" do
  before(:each) do
    @user = User.create!(uid: "123", username: "testuser")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit dashboard_path
  end

  it "can see link to search for units and will not see start fight link until 2 units are chosen" do
    expect(page).to have_content("Welcome to Warhammer 40k Battlegrounds")

    expect(page).to_not have_css(".attacker")
    expect(page).to_not have_css(".defender")

    expect(page).to have_link("Choose Units", href: search_index_path)
    expect(page).to_not have_link("Start Fight", href: fight_index_path)

    click_link("Choose Units")

    expect(page).to have_current_path(search_index_path)
    
    within("#factions") do
      select "Necrons", :from => :faction_id
      click_button("Search For Units")
    end

    within("#unit_1") do
      choose("attacker")
    end
    within("#unit_2") do
      choose("defender")
    end

    click_button("Submit")
# save_and_open_page
    expect(page).to have_css(".attacker")
    expect(page).to have_css(".defender")
    expect(page).to have_button("Start Fight")
  end
end
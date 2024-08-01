require "rails_helper"

RSpec.describe "dashboard" do
  before(:each) do
    user = User.create!(uid: "123", username: "testuser")
    # session[:user] = user
    # page.set_rack_session(user: { "id" => user.id })
    # binding.pry
    # visit new_session_path
    # fill_in "Username", with: user.username
    # click_button "Login"

    # page.driver.browser.basic_authorize(user.username, user.uid)
    # page.driver.browser.set_cookie("user_id=#{user.id}")
    # page.driver.browser.get("#{login_path}?code=valid_code")
    #THIS NEEDS WORK, SHOULD PROBABLY IMPLEMENT STANDARD USER LOGIN

    visit dashboard_path
  end

  it "can see link to search for units and will not see start fight link until 2 units are chosen" do
    expect(page).to have_content("Welcome to Warhammer 40k Battlegrounds")

    expect(page).to_not have_css(".player")
    expect(page).to_not have_css(".opponent")

    expect(page).to have_link("Choose Units", href: search_index_path)
    expect(page).to_not have_link("Start Fight", href: fight_index_path)

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
    expect(page).to have_button("Start Fight")
  end
end
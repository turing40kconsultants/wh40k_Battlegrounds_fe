require "rails_helper"

RSpec.describe "dashboard" do
  before(:each) do
    user = User.create!(uid: "123", username: "testuser")
    @attacker = WhService.get_units_by_faction(2)[:data].first.to_json
    @defender = WhService.get_units_by_faction(1)[:data].first.to_json

    visit fight_index_path(attacker: @attacker, defender: @defender)
  end

  it "displays results of Fight", :vcr do
    # save_and_open_page
    expect(page).to_not have_css(".results")
  end
end
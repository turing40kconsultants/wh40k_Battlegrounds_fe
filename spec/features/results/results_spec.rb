require 'rails_helper'

RSpec.feature "Results", type: :feature do
  it "can see results" do
    visit results_path(wounds: 6, kills: 3)

    expect(page).to have_content("Results")
    expect(page).to have_content("You landed 6 wounds on the Chaos Space Marine")
    expect(page).to have_content("Your attack killed 3 Chaos Space Marines")
    expect(page).to have_content("Burn the Heretic!")
    expect(page).to have_link("Fight Again")

    click_link "Fight Again"

    expect(current_path).to eq(battle_index_path)
  end
end

require 'rails_helper'

RSpec.feature "Results", type: :feature do
  it "can see results" do
    visit results_path(wounds: 6, kills: 1)

    expect(page).to have_content("Results")
    expect(page).to have_content("You dealt 6 wounds!")
    expect(page).to have_content("Your attack killed 1 Unit")
    expect(page).to have_content("Burn the Heretic!")
    # expect(page).to have_link("Fight Again")
    expect(page).to have_link("Prepare the Next Battle")

    # click_link "Fight Again"
    click_link "Prepare the Next Battle"

    expect(current_path).to eq(dashboard_path)
  end
end

require 'rails_helper'

RSpec.describe "Log In" do
  before(:each) do
    @user1 = User.create!(email: "test@test.com", password: "123456", password_digest: "123456")
  end

  it "can log in to an account successfully" do
    visit "/login"

    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
    expect(page).to have_button("Log In")

    fill_in :email, with: "test@test.com"
    fill_in :password, with: "123456"

    click_on "Log In"
    # expect(current_path).to eq(user_dashborad_path(@user1))
  end
end
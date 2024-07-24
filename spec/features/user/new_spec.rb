require 'rails_helper'

RSpec.describe "New User" do
  it "can create a new account" do
    visit "/new_account"
    
    expect(page).to have_content("Create Account")

    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
    expect(page).to have_field(:password_digest)
    expect(page).to have_button("Create New Account")

    fill_in :email, with: "test@test.com"
    fill_in :password, with: "123123"
    fill_in :password_digest, with: "123123"

    click_on "Create New Account"
    expect(current_path).to eq("/dashboard")
  end
end
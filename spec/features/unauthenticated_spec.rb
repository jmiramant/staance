require 'spec_helper'

describe "Unauthenticated User" do

  it "can only reach index and show pages" do
    visit new_campaign_path
    expect(page).to have_content("Sign in")

    visit campaigns_path
    expect(page).to have_content("All Campaigns")
  end

  it "can create an account", js: true do
    visit root_path

    click_link("SIGN UP")

    fill_in "user[email]", with: "test@test.me"
    fill_in "user[password]", with: "abcabcabc"
    fill_in "user[password_confirmation]", with: "abcabcabc"
    click_button('Sign up')

    expect(page).to have_content "LOGOUT"
  end


end

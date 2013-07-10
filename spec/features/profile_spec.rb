require 'spec_helper'


describe "Profile" do

  include FeatureHelpers

  before do
    @user = create(:user)
    login(@user)
  end

  it "can update user profile", js: true do
    visit edit_user_registration_path
    fill_in "user_about_me", with: "I like kittens"
    fill_in "user_current_password", with: "password"
    click_on "Update"
    expect(page).to have_content "I like kittens"
  end

  it "can connect account to Twitter", js: true do
    visit 'http://twitter.com'
    page.reset!  #Selenium can only affect cookies in the current domain
    visit edit_user_registration_path
    click_on "Connect Your Twitter Account"
    fill_in "username_or_email", with: ENV['TWITTERUSER']
    fill_in "password", with: ENV['TWITTERPASS']
    click_on "allow"
  end

end

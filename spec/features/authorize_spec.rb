require 'spec_helper'

describe Authentication do

  include FeatureHelpers

  before do

  end

  it "connects via Twitter auth", js: true do
    visit 'http://twitter.com'
    page.reset! #Selenium can only affect cookies in the current domain 
    visit "/users/auth/twitter"
    fill_in "username_or_email", with: ENV['TWITTERUSER']
    fill_in "password", with: ENV['TWITTERPASS']
    click_on "allow"
    fill_in "user_email", with: "mark@wilson.com"
    click_on "Sign up"
    expect(page).to have_content("mark@wilson.com")
  end

  # it "connects to Facebook auth", js: true do
  #   visit "/users/auth/facebook"
  #   expect(page).to have_content("Facebook")
  # end

  it "sends reset password request", js: true do
    @user = create(:user)
    visit new_user_password_path
    fill_in "user_email", with: @user.email
    click_on "Send me reset password instructions"
    expect(page).to have_content("Reset password instructions sent")
  end

end

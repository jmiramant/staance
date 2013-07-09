require 'spec_helper'

describe Authentication do

  include FeatureHelpers

  it "connects to Twitter auth", js: true do
    visit "/users/auth/twitter"
    expect(page).to have_content("Read Tweets")
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

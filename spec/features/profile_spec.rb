require 'spec_helper'


describe "Profile" do

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
end

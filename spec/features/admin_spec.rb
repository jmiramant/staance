require 'spec_helper'

describe "Admin Access" do

  include FeatureHelpers

  it "non-admin cannot reach admin page" do
    user = create(:user)
    login(user)
    visit rails_admin_path
    expect(page).to have_content("CREATE CAMPAIGN")
  end

  it "admin can reach admin page" do
    user = create(:user)
    user.admin = true
    login(user)
    visit rails_admin_path
    expect(page).to have_content("Site administration")
  end
end

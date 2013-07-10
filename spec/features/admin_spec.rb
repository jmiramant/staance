require 'spec_helper'

describe "Admin Access" do

 let(:user) { create(:user) }

  it "non-admin cannot reach admin page" do
    login(user)
    visit rails_admin_path
    expect(page).to have_content("CREATE CAMPAIGN")
  end

  it "admin can reach admin page" do
    user.admin = true
    login(user)
    visit rails_admin_path
    expect(page).to have_content("Site administration")
  end
end

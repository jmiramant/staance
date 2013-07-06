require 'spec_helper'


describe "Admin Access" do

  include FeatureHelpers

  it "non-admin cannot reach admin page" do
    user = create(:user)
    login(user)
    visit rails_admin_path
    expect(page).to have_content("CREATE A CAMPAIGN")
  end

end

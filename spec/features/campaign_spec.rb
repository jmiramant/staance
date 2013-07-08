require 'spec_helper'


describe "Campaign Feature Tests" do

  include FeatureHelpers

  before do
    user = create(:user)
    login(user)
    topic = Topic.create(title: "Topic Title")
    @campaign = FactoryGirl.create(:campaign)
    @campaign.topic = topic
    @campaign.save
    CampaignUser.create(user_id: user.id, campaign_id: @campaign.id, user_type: CREATOR )
  end

  it "can reach campaign page" do
    visit campaign_path(@campaign)
    expect(page).to have_content("Campaign Title")
  end

  it "can click support" do
    visit campaign_path(@campaign)
    click_on "Support"
    expect page.has_link?("Supported")
  end
end

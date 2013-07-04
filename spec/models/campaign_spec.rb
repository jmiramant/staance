require 'spec_helper'

describe Campaign do

  before do
    @user = FactoryGirl.create(:user)
    @topic = Topic.create(title: "Topic Title")
  end

  it "creates a basic campaign instance" do
    campaign = FactoryGirl.create(:campaign)
    campaign.topic = @topic
    CampaignUser.create(campaign_id: campaign.id, user_id: @user.id, user_type: "Creator")
    campaign.save
    expect(Campaign.first.users).to eq campaign.users
  end
end
 

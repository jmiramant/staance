require 'spec_helper'

describe Campaign do
  let(:user) { create(:user) }
  let(:topic) {  Topic.create(title: "Topic Title") }

  it "creates a basic campaign instance" do
    campaign = create(:campaign)
    campaign.topic = @topic
    # factory girl
    CampaignUser.create(campaign_id: campaign.id, user_id: user.id, user_type: CREATOR)
    campaign.save
    expect(Campaign.first.users).to eq campaign.users
  end
end


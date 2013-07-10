require 'spec_helper'
require 'sidekiq/testing'

describe Campaign do

  # from SHADI -- instead of before do, use "let", i.e.
  # let(:user) { create(:user) }
  # let(:topic) { Topic.create(title: "Topic Title") }

  before do
    @user = FactoryGirl.create(:user)
    @topic = Topic.create(title: "Topic Title")
    @campaign = FactoryGirl.create(:campaign)
  end

  it "creates a basic campaign instance" do
    # from SHADI - campaign = create(:campaign)
    @campaign.topic = @topic
    CampaignUser.create(campaign_id: @campaign.id, user_id: @user.id, user_type: CREATOR)
    @campaign.save
    expect(Campaign.first.users).to eq @campaign.users
  end

  it "creates and executes a Sidekiq event" do
    # CampaignUser.create(campaign_id: @campaign.id, user_id: @user.id, user_type: DONOR, donation_amount: 100)
    @campaign.status = FUNDED
    @campaign.save
    ScheduledWorker.jobs.clear
    expect {
      ScheduledWorker.perform_async(@campaign.id)
      }.to change(ScheduledWorker.jobs, :size).by(1)
    expect {ScheduledWorker.drain}.to change(ScheduledWorker.jobs, :size).by(-1)
  end

end
 

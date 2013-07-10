require 'spec_helper'

describe "Home Page" do

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

  it "can visit home_page" do
    visit root_path
    expect(page).to have_content("TOPICS")
  end

  it "can select by Topic", js: true do
    visit root_path
    click_on "TOPICS"
    click_on "Topic Title"
    expect(page).to have_content("Campaign Title")
  end

  it "can select by Most Funded", js: true do
    visit root_path
    click_on "MOST FUNDED"
    expect(page).to have_content("Campaign Title")
  end
end

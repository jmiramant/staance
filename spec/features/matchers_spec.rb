require 'spec_helper'


describe "Matcher" do

  before do
    user = create(:user)
    login(user)
    @campaign = FactoryGirl.create(:campaign)
    topic = Topic.create(title: "Topic Title")
    @campaign.topic = topic
    @campaign.save
    CampaignUser.create(user_id: user.id, campaign_id: @campaign.id, user_type: CREATOR )
  end

  it "can create new Match Entry" do
    visit new_campaign_matcher_path(@campaign)
    fill_in "matcher_name", with: "Peter Graves"
    fill_in "matcher_logo_url", with: "http://devbootcamp.com/imgs/logo.png"
    fill_in "matcher_description", with: "Because it's the right thing to do"
    fill_in "matcher_match_amount", with: "1000"
    fill_in "matcher_count", with: "10"
    click_on "Create Matcher"
    expect(page).to have_content("Campaign Title")
  end

  it "can connect a Match to a Campaign" do
    visit new_campaign_matcher_path(@campaign)
    fill_in "matcher_name", with: "Peter Graves"
    fill_in "matcher_logo_url", with: "http://devbootcamp.com/imgs/logo.png"
    fill_in "matcher_description", with: "Because it's the right thing to do"
    fill_in "matcher_match_amount", with: "1000"
    fill_in "matcher_count", with: "10"
    click_on "Create Matcher"
    expect(Campaign.first.campaign_matchers).to eq @campaign.campaign_matchers
  end

end

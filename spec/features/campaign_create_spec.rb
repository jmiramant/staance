require 'spec_helper'

describe "Create Campaign Form Tests" do

  include FeatureHelpers

  before do
    @user = create(:user)
    login(@user)
    @topics = ["Community", "Pickles"]
  end
  
  it "shows first form page", js: true do
    visit new_campaign_path
    fill_in 'campaign_title', with: 'some title'
    fill_in 'campaign_tag_list', with: 'some tag'
    fill_in 'campaign_video_url', with: 'some video'
    fill_in 'campaign_image_url', with: 'some image'
    fill_in 'campaign_location', with: 'some location'
    fill_in 'campaign_short_blurb', with: 'this is a short blurb'
    # select 'Community', from: 'campaign_topic_id'
    click_on "Step 2"
    page.driver.browser.manage.window.maximize
    find("#cont_button").click
    fill_in 'campaign_cause_url', with: "some cause url"
    fill_in 'campaign_funding_deadline', with: "12/12/2013"
    fill_in 'campaign_funding_goal', with: "100000"
    click_on "Update Campaign"
    sleep(3)
    expect(page).to have_content "Campaign Number 1"
  end


end

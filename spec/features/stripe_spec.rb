require 'spec_helper'

describe "Stripe Tests" do

  before do
    user = create(:user)
    login(user)
    topic = Topic.create(title: "Topic Title")
    @campaign = FactoryGirl.create(:campaign)
    @campaign.topic = topic
    @campaign.save
    CampaignUser.create(user_id: user.id, campaign_id: @campaign.id, user_type: CREATOR )
  end

  it "can make a donation on a test credit card", js: true do
    visit campaign_path(@campaign)
    sleep(2)
    fill_in "donation", with: 1000
    click_on "Donate!"
    # click_on "Donate!"
    sleep(3)
    within_frame 7 do
      fill_in "paymentNumber", with: "4242 4242 4242 4242"
      fill_in "paymentExpiry", with: "12/2014"
      fill_in "paymentName", with: "Mark Wilson"
      fill_in "paymentCVC", with: "123"
      click_on "Pay $1000.00"
    end
    sleep(5)
    expect(page).to have_content("PROFILE")
  end
end



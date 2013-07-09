module StripeHelper
  def update_donation_total(campaign, donation)
    campaign_user = CampaignUser.find_or_create_by_campaign_id_and_user_id_and_user_type(campaign.id, current_user.id, DONOR)
    campaign.donation_total -= campaign_user.donation_amount if campaign_user.donation_amount
    
    campaign_user.donation_amount = donation
    campaign_user.save

    campaign.donation_total += donation
    campaign.save

    update_funding_status(campaign)
  end

  def update_funding_status(campaign)
    # p "checking status"
    # p campaign.status
    # p campaign.donation_total
    # p campaign.funding_goal
    campaign.status = "Funded" if campaign.donation_total >= campaign.funding_goal
    campaign.save
    # p campaign.status
  end
end

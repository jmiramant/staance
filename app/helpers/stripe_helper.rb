module StripeHelper
  def update_donation_total(campaign, donation)
    campaign_user = CampaignUser.find_or_create_by_campaign_id_and_user_id_and_user_type(campaign.id, current_user.id, DONOR)
    campaign.donation_total -= campaign_user.donation_amount if campaign_user.donation_amount

    campaign_user.donation_amount = donation
    campaign_user.save
  end

  def update_funding_status(campaign)
    campaign.status = "Funded" if campaign.donation_total >= campaign.funding_goal
    campaign.save
    p campaign.status
  end
end

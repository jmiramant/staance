module TaggingHelper
  
  def trending_campaigns_filter
    p recently_updated = CampaignUser.where("updated_at > ?", 1.week.ago)
    trending_campaigns = recently_updated.group_by {|camp| camp.campaign_id }
    camp_ids = trending_campaigns.sort {|camp_id, camps| camps.count}.map {|camp| camp = camp[0]}[0..5]
    Campaign.where(id: camp_ids).where("status != ?", PENDING).limit(6)
  end

  def most_funded_filter
    Campaign.where("status != ?", PENDING).order("donation_total DESC").limit(6)
  end

  def most_successful_filter
    Campaign.where("status != ?", PENDING).order("donation_total/funding_goal DESC").limit(6)
  end
end

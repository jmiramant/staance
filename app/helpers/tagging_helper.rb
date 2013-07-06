module TaggingHelper
  
  def trending_campaigns_filter
    recently_updated = CampaignUser.where(["updated_at > ?", 1.week.ago])
    trending_campaigns = recently_updated.group_by {|camp| camp.campaign_id }
    trending_campaigns.sort {|camp_id, camps| camps.count}
    trending_campaigns.map {|camp| camp = camp[0]}
  end

  def most_funded_filter
    funded_campaigns = Campaign.where(status: "Funded").where(["funding_deadline <  ?", Date.today()])
    funded_campaigns.sort_by {|camp| camp.donation_total}
  end

  def most_successful_filter
    funded_campaigns = Campaign.where(status: "Funded").where(["funding_deadline <  ?", Date.today()])
    funded_campaigns.sort_by {|camp| camp.donation_total/camp.funding_goal}
  end

  def most_controversial_filter
  end

end

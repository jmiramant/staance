module TaggingHelper
  def trending_filter(topic = nil)
    recently_updated = CampaignUser.where("updated_at > ?", 1.week.ago)
    trending_campaign_users = recently_updated.group_by {|camp| camp.campaign_id }
    camp_ids = trending_campaign_users.sort {|camp_id, camps| camps.count}.map {|camp| camp = camp[0]}
    unless topic == nil
      topic_id = Topic.find_by_title(topic).id
      Campaign.where(topic_id: topic_id).where(id: camp_ids).limit(9)
    else
      Campaign.where(id: camp_ids).where(status: ACTIVE).limit(6)
    end
  end

  def most_funded_filter(topic = nil)
    unless topic == nil
      topic_id = Topic.find_by_title(topic).id
      return Campaign.where(topic_id: topic_id).order("donation_total DESC").limit(9)
    else
      return Campaign.order("donation_total DESC").limit(6)
    end 
  end

  def most_successful_filter(topic = nil)
    unless topic == nil
      topic_id = Topic.find_by_title(topic).id
      Campaign.where(topic_id: topic_id).order("donation_total/funding_goal DESC").limit(9)
    else
      return Campaign.order("donation_total/funding_goal DESC").limit(6)
    end 
  end
end

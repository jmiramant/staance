module TaggingHelper
  # def trending_filter(topic = nil)
  #   # create trending campaigns method in Campaign model to encapsulate all this logic
  #   recently_updated = CampaignUser.where("updated_at > ?", 1.week.ago)
  #   trending_campaign_users = recently_updated.group_by {|camp| camp.campaign_id }
  #   camp_ids = trending_campaign_users.sort {|camp_id, camps| camps.count}.map {|camp| camp = camp[0]}
  #   unless topic.nil?
  #     topic_id = Topic.find_by_title(topic).id
  #     # include this logic in trending campaign method so we can call Campaign.trending(num, topic = nil)
  #     Campaign.where(topic_id: topic_id).where(id: camp_ids).limit(9)
  #   else
  #     # same as above, just call Campaign.trending(6, "Environment")
  #     Campaign.where(id: camp_ids).where(status: ACTIVE).limit(6)
  #   end
  # end

  # Moved to Campaign model (most_funded(num, topic))
  # def most_funded_filter(topic = nil)
  #   unless topic.nil?
  #     topic_id = Topic.find_by_title(topic).id
  #     # create most_funded campaigns method, i.e. Campaign.most_funded(num, topic = nil)
  #     Campaign.where(topic_id: topic_id).order("donation_total DESC").limit(9)
  #   else
  #     # call Campaign.most_funded(6, "Environment")
  #     Campaign.order("donation_total DESC").limit(6)
  #   end 
  # end

  # Moved to Campaign model (most_successful(num, topic))
  # def most_successful_filter(topic = nil)
  #   unless topic.nil?
  #     topic_id = Topic.find_by_title(topic).id
  #     # create most_successful campaigns method, i.e. Campaign.most_successful(num, topic = nil)
  #     Campaign.where(topic_id: topic_id).order("donation_total/funding_goal DESC").limit(9)
  #   else
  #     # call Campaign.most_successful(6, "Environment")
  #     Campaign.order("donation_total/funding_goal DESC").limit(6)
  #   end 
  # end
end

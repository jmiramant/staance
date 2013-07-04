module ViewHelper

  def campaign_by_topic(topic)
    @campaigns = Campaign.where(topic_id: topic.id)
    @campaigns ? @campaigns : []
  end

end

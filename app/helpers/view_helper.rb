module ViewHelper

  def campaign_by_topic(topic)
    @campaigns = []
    @campaigns << Campaign.find_by_topic_id(topic.id)
    @campaigns ? @campaigns : []
  end

end

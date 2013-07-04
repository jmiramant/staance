module ViewHelper

  def campaign_by_topic(topic)
    @campaigns = Campaign.where(topic_id: topic.id)
    @campaigns ? @campaigns : []
  end

  def to_currency(int)
    ActionController::Base.helpers.number_to_currency(int, :precision => 0)
  end
end

module ViewHelper

  # def campaign_by_topic(topic)
  #   @campaigns = Campaign.where(topic_id: topic.id, status: ACTIVE)
  #   @campaigns ? @campaigns : []
  # end

  # def campaign_count_by_topic(topic)
  #   @count = Campaign.where(topic_id: topic.id, status: ACTIVE).count
  # end

  def to_currency(int)
    ActionController::Base.helpers.number_to_currency(int, :precision => 0)
  end
end

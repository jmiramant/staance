class Campaign < ActiveRecord::Base
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::TextHelper

  attr_accessible :topic_id, :image_url, :video_url, :funding_deadline, :stance 
  attr_accessible :short_blurb, :location, :cause_url, :funding_goal, :pitch, :title
  attr_accessible :tag_list, :donation_total, :opposing_campaign_id, :status

  validates_presence_of :title, :short_blurb, :location, :image_url

  has_many :campaign_users
  has_many	:users, through: :campaign_users
  belongs_to :topic

  acts_as_taggable

  def separated_time_ago
    seconds = self.funding_deadline - Time.zone.now
    if seconds / 86400 > 1
      result = { 'day' => (seconds / 86400).to_i }
    elsif seconds % 3600
      result = { 'hour' => (seconds / 3600).to_i }
    else
      result = { 'minute' => (seconds / 60).to_i }
    end
    pluralized = pluralize(result.values.first, result.keys.first)
    pluralized.split(' ')
  end

  def supporters
    CampaignUser.where('campaign_id = ? and user_type = ?', self.id, "Supporter")
  end
end
# :funding_deadline, :pitch, :funding_goal

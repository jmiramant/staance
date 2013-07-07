class Campaign < ActiveRecord::Base
  attr_accessible :topic_id, :image_url, :video_url, :funding_deadline, :stance 
  attr_accessible :short_blurb, :location, :cause_url, :funding_goal, :pitch, :title
  attr_accessible :tag_list, :donation_total, :opposing_campaign_id, :status

  validates_presence_of :title, :short_blurb, :location, :image_url

  has_many :campaign_users
  has_many	:users, through: :campaign_users
  belongs_to :topic

  acts_as_taggable

end
# :funding_deadline, :pitch, :funding_goal

class Campaign < ActiveRecord::Base
  attr_accessible :topic_id, :image_url, :video_url, :stance, :funding_deadline 
  attr_accessible :short_blurb, :location, :cause_url, :funding_goal, :pitch, :title
  attr_accessible :tag_list

  has_many :campaign_users
  has_many	:users, through: :campaign_users
  belongs_to :topic

  acts_as_taggable

end

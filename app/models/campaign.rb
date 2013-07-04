class Campaign < ActiveRecord::Base
  attr_accessible :topic, :image_url, :video_url, :stance, :funding_deadline, :funding_goal, :pitch, :description

  has_many :campaign_users
  has_many	:users, through: :campaign_users
  belongs_to :topic

end

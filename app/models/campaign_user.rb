class CampaignUser < ActiveRecord::Base
  attr_accessible :user_type, :campaign_id, :user_id
  attr_accessor :user_type
  belongs_to	:user 
  belongs_to	:campaign

  # validates :user_id, :user_type, presence: true
end

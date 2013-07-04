class CampaignUser < ActiveRecord::Base
  attr_accessible :campaign_id, :user_id, :user_type

  belongs_to	:user
  belongs_to	:campaign

  # validates :user_id, :user_type, presence: true
end

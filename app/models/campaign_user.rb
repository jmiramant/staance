class CampaignUser < ActiveRecord::Base
  attr_accessible :user_type, :campaign_id, :user_id
  
  belongs_to	:user 
  belongs_to	:campaign
end

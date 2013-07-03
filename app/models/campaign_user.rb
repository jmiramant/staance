class CampaignUser < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to	:userable, polymorphic: true 
  belongs_to	:campaign
end

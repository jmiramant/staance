class CampaignUser < ActiveRecord::Base
  attr_accessible :user_type, :campaign_id, :user_id, :donation_amount
  
  validates_presence_of :campaign_id, :user_id
  validates_uniqueness_of :user_type, scope: [:campaign_id, :user_id]
  belongs_to :user
  belongs_to :campaign, :dependent => :destroy
  has_many :matchers

end

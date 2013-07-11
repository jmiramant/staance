class CampaignUser < ActiveRecord::Base
  attr_accessible :user_type, :campaign_id, :user_id, :donation_amount
  
  validates_presence_of :campaign_id, :user_id
  validates_uniqueness_of :user_type, scope: [:campaign_id, :user_id]
  belongs_to :user
  belongs_to :campaign
  has_many :matchers

  def self.campaign_supporters(camp_id)
    self.where('campaign_id = ? and user_type = ?', camp_id, SUPPORTER)
  end

  def self.campaign_donors(camp_id)
    self.where('campaign_id = ? and user_type = ?', camp_id, DONOR)
  end

  def self.creator(camp_id)
    self.where('campaign_id = ? and user_type = ?', camp_id, CREATOR)
  end
  
end

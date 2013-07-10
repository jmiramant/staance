class CampaignUser < ActiveRecord::Base
  attr_accessible :user_type, :campaign_id, :user_id, :donation_amount

  validates_presence_of :campaign_id, :user_id
  validates_uniqueness_of :user_type, scope: [:campaign_id, :user_id]

  belongs_to	:user
  belongs_to	:campaign, :dependent => :destroy

  before_save :update_donation_total

  def self.campaign_supporters(campaign)
    self.where('campaign_id = ? and user_type = ?', campaign.id, "Supporter")
  end

  def update_donation_total
    self.campaign.donation_total += donation
  end
end

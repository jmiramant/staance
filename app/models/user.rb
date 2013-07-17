class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :about_me

  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:twitter, :facebook]

  has_many :campaign_users, dependent: :destroy
  has_many :authentications, dependent: :destroy
  has_many :campaigns, through: :campaign_users

  def apply_omniauth(omni)
    authentications.build(provider: omni['provider'], uid: omni['uid'],
                          token: omni['credentials'].token,
                          token_secret: omni['credentials'].secret)
  end

  def password_required?
    authentications.empty? && super
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def supporter?(camp_id)
    user = CampaignUser.where('user_id = ? and campaign_id = ? and user_type = ?', self.id, camp_id, SUPPORTER)
    !user.blank?
  end

  def authenticated_networks
    # use INJECT!
    authenticated_networks = []
    self.authentications.each do |auth|
      authenticated_networks << auth[:provider]
    end
    authenticated_networks
  end

  def supported_campaigns
    supports = self.campaign_users.where(user_type: SUPPORTER).pluck("campaign_id")
    supports.present? ? supports.inject([]) {|campaigns, campaign_id|  campaigns << Campaign.find(campaign_id)} : []
  end

  def donated_campaigns
    donated = self.campaign_users.where(user_type: DONOR).pluck("campaign_id")
    donated.present? ? donated.inject([]) {|campaigns, campaign_id| campaigns << Campaign.find(campaign_id)} : []
  end

  def pending_campaigns
    created = self.created_campaigns
    campaigns = []
    if created.present?
      active = created.each do |camp| 
        campaigns << camp if camp.status == PENDING
      end
    end
    campaigns
  end

  def active_campaigns
    created = self.created_campaigns
    campaigns = []
    if created.present?
      active = created.each do |camp| 
        campaigns << camp if camp.status == ACTIVE
      end
    end
    campaigns
  end

  def created_campaigns
    created = self.campaign_users.where(user_type: CREATOR).pluck("campaign_id")
    created.inject([]) {|campaigns, campaign_id| campaigns << Campaign.find(campaign_id)} if created.present?
  end
end

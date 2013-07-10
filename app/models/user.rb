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
    CampaignUser.where('user_id = ? and campaign_id = ? and user_type = ?', camp_id, self.id, SUPPORTER)
  end

  def authenticated_networks
    # use INJECT!
    authenticated_networks = []
    self.authentications.each do |auth|
      authenticated_networks << auth[:provider]
    end
    authenticated_networks
  end

  # Shadi moved logic from users_controller --> check that it works
  # def supported_campaigns
    # supports = self.campaign_users.where(:user_type => SUPPORTER).pluck("campaign_id")
    # supports.inject([]) {|campaigns, campaign_id|  campaigns << Campaign.find(campaign_id)} if supports.present?
  # end
end

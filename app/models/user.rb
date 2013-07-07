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
    # (authentications.empty? || !password.blank?) && super ==> keeping in fear of not knowing what it's doing...
    authentications.empty? && super
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def supported_campaigns
    @support = []
    self.campaign_users.each {|support| @support << support.campaign_id }
    @support
  end

  def authenticated_networks
    authenticated_networks = []
    self.authentications.each do |auth|
      authenticated_networks << auth[:provider]
    end
    authenticated_networks
  end

  def is_admin?
    self.admin == true
  end
end

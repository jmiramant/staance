class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:twitter, :facebook]
  has_many :campaign_users, :dependent => :destroy
  has_many :authentications, :dependent => :destroy
  has_many :campaigns, through: :campaign_users
  
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def apply_omniauth(omni)
    authentications.build(provider: omni['provider'], uid: omni['uid'],
                          token: omni['credentials'].token,
                          token_secret: omni['credentials'].secret)
  end

  def password_required?
    #(authentications.empty? || !password.blank?) && super  ORIGINAL LINE - DON'T UNDERSTAND WHY !password.blank? required
    authentications.empty? && super
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end

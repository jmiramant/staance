class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:twitter, :facebook]
  has_many :campaign_users 
  has_many :authentications
  has_many :campaigns, through: :campaign_users
  
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def apply_omniauth(omni)
    authentications.build(provider: omni['provider'], uid: omni['uid'],
                          token: omni['credentials'].token,
                          token_secret: omni['credentials'].secret)
  end
end

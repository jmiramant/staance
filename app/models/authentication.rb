class Authentication < ActiveRecord::Base
  belongs_to :user

  attr_accessible :provider, :uid, :token, :token_secret
end


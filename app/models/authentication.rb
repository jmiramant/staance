class Authentication < ActiveRecord::Base
  attr_accessible :provider, :uid, :token, :token_secret

  belongs_to :user
end


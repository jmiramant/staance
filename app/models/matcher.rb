class Matcher < ActiveRecord::Base
  attr_accessible :name, :match_amount, :logo_url, :description, :campaign_user_id, :count

  validates_presence_of :name, :campaign_user_id

  belongs_to :campaign_user

end

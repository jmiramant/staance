class Topic < ActiveRecord::Base
	attr_accessible :title, :description

	has_many :campaigns
  
  validates :title, uniqueness: true
end

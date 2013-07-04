class Topic < ActiveRecord::Base
	attr_accessible :title, :description

	has_many :campaigns
  validates :title, uniqueness: true

  # attr_accessible :title, :body
end

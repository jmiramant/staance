class Topic < ActiveRecord::Base
	attr_accessible :title, :description

	has_many :campaigns

  # attr_accessible :title, :body
end

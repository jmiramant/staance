class Topic < ActiveRecord::Base
	attr_accessible :title, :description

	has_many :campaigns
  
  validates :title, uniqueness: true


  TOPICS = ["Community", "Diversity", "Economy", "Environment",
            "Guns & Crime", "Health", "Immigration", "International",
            "LGBTQQ", "Military", "Parenting", "Politics", "Science & Technology",
            "Spanish", "Women", "Employment"]

end


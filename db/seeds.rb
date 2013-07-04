# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# ruby encoding: utf-8

TOPICS = ["Community", "Diversity", "Economy", "Environment",
"Guns & Crime", "Health", "Immigration", "International",
"LGBTQQ", "Military", "Parenting", "Politics", "Science & Technology",
"Spanish", "Women", "Employment"]

TOPICS.each { |topic| Topic.find_or_create_by_title(topic) }

lloyd = User.create(email: "ltaylor@netelder.com", password: "password")
josh = User.create(email: "josh@miramant.me", password: "password")

campaign1 = Campaign.new(title: "Campaign Number 1", short_blurb: "Blurb for Campaign Number 1")
campaign1.location = "San Francisco"
campaign1.cause_url = "http://www.yahoo.com"
campaign1.funding_deadline = Time.now
campaign1.topic = Topic.find(3)
campaign1.save
CampaignUser.create(campaign_id: campaign1.id, user_id: lloyd.id, user_type: "Creator")

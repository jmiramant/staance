# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# ruby encoding: utf-8

TOPICS.each { |topic| Topic.find_or_create_by_title(topic) }

lloyd = User.create(email: "ltaylor@netelder.com", password: "password", name: "Lloyd Taylor")
josh = User.create(email: "josh@miramant.me", password: "password", name: "Josh Miramant")

campaign1 = Campaign.new(title: "Campaign Number 1", short_blurb: "Blurb for Campaign Number 1")
campaign1.location = "San Francisco"
campaign1.cause_url = "http://www.yahoo.com"
campaign1.funding_deadline = Time.now
campaign1.funding_goal = 10000
campaign1.pitch = "Give me money so that I can make the world a better place for kittens and puppies!"
campaign1.image_url = "http://www.warrenphotographic.co.uk/photography/bigs/26624-Yellow-Goldidor-Retriever-pup-with-blue-tabby-kitten-white-background.jpg"
campaign1.topic = Topic.first
campaign1.save
CampaignUser.create(campaign_id: campaign1.id, user_id: lloyd.id, user_type: CREATOR)
CampaignUser.create(campaign_id: campaign1.id, user_id: josh.id, user_type: DONOR, donation_amount: 1000000)

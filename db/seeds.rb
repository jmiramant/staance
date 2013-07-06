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
campaign1.video_url = "http://vimeo.com/13081864"
campaign1.funding_deadline = Time.now
campaign1.funding_goal = 10000
campaign1.pitch = "What Is HoneyColony? Remember when your mom used to tell you to eat your peas and carrots? Remember when peas and carrots weren't smothered in pesticides? We're a hive of health-conscious writers, consumers and foodies who want to share our stories and exchange information with you, your friends and everyone else who wants full disclosure about our bodies and what goes into them. For every yummy hotdog and every bag of glowing Cheetos, we bring wisdom without the guilt. Like you, we care about the plight of the honeybees. And we have a few questions. Do soybeans cause cancer? Are GMO foods behind the soaring rates of autism and obesity? Where can we find a luscious bar of organic raw chocolate? Do we want every patch of soil to be patented? Why HoneyColony? As an investigative health news forum, we curate great information and alternative viewpoints, and introduce you to sustainable products from conscious vendors. You'll find amazing skin care, superfoods and supplements from companies with integrity including Puro3, Healthforce Nutritionals and Essential Living Foods. When Did HoneyColony Arrive? Our founder, Maryam Henein, followed the puzzling fate of the vanishing bees after experiencing her own near-death experience. On the road to recovery, she discovered alternative healing practices, superfoods and the power of information. She directed the award-winning documentary film, Vanishing of the Bees, which takes a scrutinizing look at big agriculture and Mother Earth, and launched HoneyColony in December 2012. How Does HoneyColony Help? Our health is collective, regardless of health insurance, health care or politics. Each of us has a health challenge, even if it's not our own. We have a friend, brother, mother, aunt or colleague who's got something that came from somewhere. We want to find out how and why disease has become so popular. The more knowledge we have, the more capable we'll be of making better decisions about what we consume. At the end of the day, we live in a supply-and-demand world. If we don't buy it, they won't sell it. So we need to be one loud voice! Check out this clip from Founder Maryam Henein http://www.youtube.com/watch?feature=player_embedded&v=oe10maAqrko What's The Social Life Like At HoneyColony? It's pretty sweet. We offer BeeBucks for active members. Post a comment, write a review via Twitter or Facebook or share with friends and we'll reward you with our virtual currency. Use it to check out any of our products and get started on a new regimen, diet, outlook or practice. What We Need & What You Get Every dollar raised will go toward building a bigger, better, more solid and expansive HoneyColony platform that can be more easily shared with friends, family members and everyone in your inner circle who wants to stay balanced, aligned and informed. We are setting an initial goal of $21,000 to complete the following: 1) HoneyColony Mobile version, to enable members to read, evaluate, shop and share via their mobile devices ($16,000). More than 50% of our users are on mobile but our platform isn't yet fully functional. 2) A social dashboard for more functionality in our online community of active members. (5,000) In honor of your support, we are offering wonderfully healthy organic perks such as wild honey from Africa, organic ozonated skin creams, raw chocolate, Vanishing of the Bees on dvd, autographed by Ellen Page, and more! We're also donating a percentage of the proceeds to two awesome organizations: The Learning Garden in Venice, a model example of how school gardens can transform the lives of students and teachers, and enhance the environment of a community. HoneyLove, a Los Angeles based 501(c)3 nonprofit conservation organization with a mission to protect the honeybees and inspire and educate new urban beekeepers. Thanks for supporting our hive and for allowing us to stay connected with you throughout health challenges and radiant times! Be in touch and let's put honesty back into mainstream health! We're at info@honeycolony.com"
campaign1.image_url = "http://www.warrenphotographic.co.uk/photography/bigs/26624-Yellow-Goldidor-Retriever-pup-with-blue-tabby-kitten-white-background.jpg"
campaign1.topic = Topic.first
campaign1.donation_total = 7853
campaign1.save
CampaignUser.create(campaign_id: campaign1.id, user_id: lloyd.id, user_type: CREATOR)
CampaignUser.create(campaign_id: campaign1.id, user_id: josh.id, user_type: DONOR, donation_amount: 1000000)

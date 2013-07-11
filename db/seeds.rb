# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# encoding: utf-8

TOPICS.each { |topic| Topic.find_or_create_by_title(topic) }

lloyd = User.create(email: "ltaylor@netelder.com", password: "password", name: "Lloyd Taylor")
josh = User.create(email: "josh@misdaramant.me", password: "password", name: "Josh Miramant")
bob = User.create(email: "bob@gmail.com", password: "password", name: "Bob Dole")
joe = User.create(email: "joe@google.com", password: "password", name: "Joe Schmoe")
dan = User.create(email: "dan@google.com", password: "password", name: "Dan Mann")
phil = User.create(email: "phil@google.com", password: "password", name: "Phil Mark")
anna = User.create(email: "anna@google.com", password: "password", name: "Anna Haggel")
lisa = User.create(email: "lisa@google.com", password: "password", name: "Lisa Krigel")
renata = User.create(email: "renata@google.com", password: "password", name: "Renata Bennet")
will = User.create(email: "will@google.com", password: "password", name: "Will Mcdermott")
paulette = User.create(email: "paulette@google.com", password: "password", name: "Paulette Juel")
shiv = User.create(email: "shiv@google.com", password: "password", name: "Shiv Winnigrad")
eadon = User.create(email: "eadon@google.com", password: "password", name: "Eadon Jacobs")
eric = User.create(email: "eric@google.com", password: "password", name: "Eric Wertshafter")
chris = User.create(email: "chris@google.com", password: "password", name: "Chris Bertin")
andrew = User.create(email: "andrew@google.com", password: "password", name: "Andrew Smith")
justin = User.create(email: "justin@google.com", password: "password", name: "Justin Hafner")
janelle = User.create(email: "janelle@google.com", password: "password", name: "Janelle Dorby")
kristin = User.create(email: "kristin@google.com", password: "password", name: "Kristin Meddy")
brian = User.create(email: "brian@google.com", password: "password", name: "Brian Deese")
allon = User.create(email: "allon@google.com", password: "password", name: "Allon Jacobs")
admin = User.create(email: "admin@staance.com", password: "password", name: "admin")

admin.admin = true
admin.save

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
campaign1.status = ACTIVE
campaign1.save
CampaignUser.create(campaign_id: campaign1.id, user_id: lloyd.id, user_type: CREATOR)
CampaignUser.create(campaign_id: campaign1.id, user_id: josh.id, user_type: DONOR, donation_amount: 10000)

campaign2 = Campaign.new(title: "Prevent Gun Violence", short_blurb: "Save our Streets")
campaign2.location = "National"
campaign2.cause_url = "http://www.nij.gov/topics/crime/gun-violence/prevention/"
campaign2.video_url = "http://www.youtube.com/watch?v=64G5FfG2Xpg"
campaign2.funding_deadline = Time.now
campaign2.funding_goal = 400000
campaign2.pitch = "Faced with a national epidemic of gun violence that began in the 1980s and continued throughout most of the 1990s, the federal government launched a new effort to help local authorities address gun crime. Many cities worked with NIJ researchers and other federal, state and local partners to design and test interventions [opens in pop-up window] to get illegally obtained guns off the streets and out of the hands of urban youth. Initially, firearms violence intervention and research focused on either reducing the demand for illegally obtained guns or reducing the supply. More than 20 years of intervention programs, however, have shown that a single approach is not likely to work. To reduce gun violence, a sustained program that addresses both demand and supply is needed. A successful intervention will have elements of federal-local law enforcement collaboration, community involvement, targeted intervention tactics and continuous program evaluation."
campaign2.image_url = "http://secure.assets.bostatic.com/resize/3513-gun-violence-fact-20130306193000.jpg"
campaign2.topic = Topic.find(5)
campaign2.donation_total = 35000
campaign2.status = ACTIVE
campaign2.save
CampaignUser.create(campaign_id: campaign2.id, user_id: lloyd.id, user_type: CREATOR)
CampaignUser.create(campaign_id: campaign2.id, user_id: eadon.id, user_type: DONOR, donation_amount: 10000)
CampaignUser.create(campaign_id: campaign2.id, user_id: dan.id, user_type: DONOR, donation_amount: 2000)
CampaignUser.create(campaign_id: campaign2.id, user_id: chris.id, user_type: DONOR, donation_amount: 20)
CampaignUser.create(campaign_id: campaign2.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
CampaignUser.create(campaign_id: campaign2.id, user_id: eadon.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign2.id, user_id: dan.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign2.id, user_id: chris.id, user_type: SUPPORTER)


campaign3 = Campaign.new(title: "Stopping Global Warming", short_blurb: "Climate change didn't happen on its own.")
campaign3.location = "New York"
campaign3.cause_url = "http://www.greenpeace.org/usa/en/campaigns/global-warming-and-energy/"
campaign3.video_url = "http://www.youtube.com/watch?v=64G5FfG2Xpg"
campaign3.funding_deadline = 1.week.ago
campaign3.funding_goal = 750000
campaign3.pitch = "But a brighter future is possible. Over the next three years, Greenpeace will: 1. Join local communities to shut down dangerous, dirty coal plants all across the United States, and support them in a transition to a renewable future. Read More. 2. Advocate for strong laws to curb global warming and put America on a path to clean energy. 3. Expose climate deniers, like the Koch Brothers, and hold them publicly accountable for providing millions of dollars to lobby against climate and clean energy policies. 4. Kick-start an Energy Revolution by advocating for clean-energy solutions like solar and wind power."
campaign3.image_url = "http://www.greenpeace.org/usa/ReSizes/OriginalWatermarked/Global/usa/planet3/photos-gwe/GP01SVG_layout.jpg"
campaign3.topic = Topic.find(4)
campaign3.donation_total = 900000
campaign3.status = "Funded"
campaign3.save
CampaignUser.create(campaign_id: campaign3.id, user_id: shiv.id, user_type: CREATOR)
CampaignUser.create(campaign_id: campaign3.id, user_id: eadon.id, user_type: DONOR, donation_amount: 10000)
CampaignUser.create(campaign_id: campaign3.id, user_id: dan.id, user_type: DONOR, donation_amount: 2000)
CampaignUser.create(campaign_id: campaign3.id, user_id: chris.id, user_type: DONOR, donation_amount: 20)
CampaignUser.create(campaign_id: campaign3.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
CampaignUser.create(campaign_id: campaign3.id, user_id: eadon.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign3.id, user_id: dan.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign3.id, user_id: chris.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign3.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
CampaignUser.create(campaign_id: campaign3.id, user_id: janelle.id, user_type: DONOR, donation_amount: 10000)
CampaignUser.create(campaign_id: campaign3.id, user_id: kristin.id, user_type: DONOR, donation_amount: 75000)
CampaignUser.create(campaign_id: campaign3.id, user_id: lisa.id, user_type: DONOR, donation_amount: 2000)
CampaignUser.create(campaign_id: campaign3.id, user_id: bob.id, user_type: DONOR, donation_amount: 500)


campaign4 = Campaign.new(title: "Stop Bullying!", short_blurb: "All across the country, students are taking a stand against bullying by putting empathy into practice.")
campaign4.location = "California"
campaign4.cause_url = "http://startempathy.org/why"
campaign4.video_url = "http://www.youtube.com/watch?v=8RSVwTJ52uI"
campaign4.funding_deadline = Time.now + 7.days
campaign4.funding_goal = 30000
campaign4.pitch = "The ability " # to understand what someone is feeling, that’s the textbook definition of empathy.  But when put into practice, empathy means a whole lot more.  It means the ability to grasp the many sides of today’s complex problems and the capacity to collaborate with others to solve them. it means being as good at listening to the ideas of others as articulating your own; it means being able to lead a team one day, and participate as a team member the next.  In today’s rapidly changing world, everything that empathy means is critical to our success at home, at school, and in the workplace.  Here you’ll find insights into why we think empathy matters, and we encourage you to share your own, too."
campaign4.image_url = "http://www.chatelaine.com/wp-content/uploads/2012/12/Stop-Bullying-Girls-with-words-written-all-over-bodies-Jan-12-p112.jpg"
campaign4.topic = Topic.find(2)
campaign4.donation_total = 5000
campaign4.status = "Unsuccessful"
campaign4.save
CampaignUser.create(campaign_id: campaign4.id, user_id: shiv.id, user_type: CREATOR)
CampaignUser.create(campaign_id: campaign4.id, user_id: eadon.id, user_type: DONOR, donation_amount: 900)
CampaignUser.create(campaign_id: campaign4.id, user_id: dan.id, user_type: DONOR, donation_amount: 2000)
CampaignUser.create(campaign_id: campaign4.id, user_id: chris.id, user_type: DONOR, donation_amount: 20)
CampaignUser.create(campaign_id: campaign4.id, user_id: andrew.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign4.id, user_id: eadon.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign4.id, user_id: dan.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign4.id, user_id: chris.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign4.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
CampaignUser.create(campaign_id: campaign4.id, user_id: janelle.id, user_type: DONOR, donation_amount: 100)
CampaignUser.create(campaign_id: campaign4.id, user_id: kristin.id, user_type: DONOR, donation_amount: 750)


campaign5 = Campaign.new(title: "Overturn Roe v. Wade!", short_blurb: "Since life begins at conception, abortion is akin to murder as it is the act of taking human life.")
campaign5.location = "National"
campaign5.cause_url = "http://www.lifenews.com/"
campaign5.video_url = "http://www.youtube.com/watch?v=HIh10_Ik5e8"
campaign5.funding_deadline = Time.now + 45.days
campaign5.funding_goal = 1000000
campaign5.pitch = "LifeNews.com is an independent news agency devoted to reporting news that affects the pro-life community. " #With a team of experienced journalists and bloggers, LifeNews.com reaches more than 750,000 pro-life advocates each week via our web site, email news reports, social networking outreach and weekday radio program. LifeNews.com also acts as a service provider to furnish news content to media that share the pro-life perspective. The topics covered by LifeNews.com include abortion, assisted suicide and euthanasia, bioethics issues such as human cloning and stem cell research, campaigns and elections, and cultural legal and legislative issues as they affect the pro-life community. Formerly the Pro-Life Infonet, LifeNews.com has been harnessing the power of the Internet since 1992 to bring pro-life news to the pro-life community. We’ve developed a reputation for fairness, accuracy and timeliness in our two decades of service. We are not affiliated with any organization, religious group, political party or church denomination."
campaign5.image_url = "http://lifenews.wpengine.netdna-cdn.com/wp-content/uploads/2013/07/heroicmedia3.png"
campaign5.topic = Topic.find(12)
campaign5.donation_total = 350000
campaign5.status = ACTIVE
campaign5.save
CampaignUser.create(campaign_id: campaign5.id, user_id: shiv.id, user_type: CREATOR)
CampaignUser.create(campaign_id: campaign5.id, user_id: eadon.id, user_type: DONOR, donation_amount: 1000)
CampaignUser.create(campaign_id: campaign5.id, user_id: dan.id, user_type: DONOR, donation_amount: 2000)
CampaignUser.create(campaign_id: campaign5.id, user_id: chris.id, user_type: DONOR, donation_amount: 5000)
CampaignUser.create(campaign_id: campaign5.id, user_id: dan.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign5.id, user_id: chris.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign5.id, user_id: andrew.id, user_type: DONOR, donation_amount: 4500)
CampaignUser.create(campaign_id: campaign5.id, user_id: janelle.id, user_type: DONOR, donation_amount: 100)
CampaignUser.create(campaign_id: campaign5.id, user_id: kristin.id, user_type: DONOR, donation_amount: 50)

campaign6 = Campaign.new(title: "Preserve a Woman's Right to Choose!", short_blurb: "Being pro-choice means protecting women's access to safe, legal abortion.")
campaign6.location = "National"
campaign6.cause_url = "www.naral.org"
campaign6.video_url = "http://www.youtube.com/watch?v=QlMbrZ8EhLQ"
campaign6.funding_deadline = Time.now + 45.days
campaign6.funding_goal = 1000000
campaign6.pitch = "A Pro Choice Student Opinion on Abortion Abortion is a controversial "# ‘hot button’ topic that is on the minds of many politicians, politicos and citizens around the world. There are just as many conflicting opinions and views as there are people debating them, but what the arguments boil down to is: Pro-Life or Pro-Choice? Whatever the circumstances may be, it is in my humble opinion that the decision on abortion should be left up to the mother. I believe that abortion is a right of the mother because taking away the right to have control over your body is unconstitutional. The freedom of choice should be reserved to solely the individual when it comes to his or her body. There are many other self-destructive activities that people engage in everyday at their own consent (e.g. alcohol, drugs, tattoos and piercings) with little or no governmental regulation. Yet these actions are often deemed socially undesirable, harmful and have incorporated risks but they are tolerated by society. On the other hand, it is also the right of the individual to exercise and eat healthy if he or she desires and denying them these practices is an injustice as well. But why should someone have a say in whether or not those actions are morally right or wrong? What is the fascination with abortion? I believe that it should be up to the individual to evaluate her conclusion on the morality of abortion and undergo or prevent only herself but to never disallow another individual of her freedom of choice to have an abortion. It is not the government’s role to place a protocol or quota on abortions. It takes away from the individual liberties the mother has for being an American citizen. Every woman seeking an abortion should have access to one. In fact, there can be many hardships and even death for mothers that are disallowed abortions."
campaign6.image_url = "http://media.pennlive.com/opinion/photo/pro-choice-art-7d1a5d660ba49784.jpg"
campaign6.topic = Topic.find(12)
campaign6.donation_total = 400000
campaign6.status = ACTIVE
campaign6.save
CampaignUser.create(campaign_id: campaign6.id, user_id: shiv.id, user_type: CREATOR)
CampaignUser.create(campaign_id: campaign6.id, user_id: eadon.id, user_type: DONOR, donation_amount: 10000)
CampaignUser.create(campaign_id: campaign6.id, user_id: dan.id, user_type: DONOR, donation_amount: 2500)
CampaignUser.create(campaign_id: campaign6.id, user_id: chris.id, user_type: DONOR, donation_amount: 1000)
CampaignUser.create(campaign_id: campaign6.id, user_id: dan.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign6.id, user_id: chris.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign6.id, user_id: andrew.id, user_type: DONOR, donation_amount: 450)
CampaignUser.create(campaign_id: campaign6.id, user_id: janelle.id, user_type: DONOR, donation_amount: 1900)
CampaignUser.create(campaign_id: campaign6.id, user_id: kristin.id, user_type: DONOR, donation_amount: 2010)

campaign7 = Campaign.new(title: "Stop the Hoax of Global Warming", short_blurb: "The Environmentalist Lie.")
campaign7.location = "New York"
campaign7.cause_url = "http://barbarasanteephd.com/category/letters-to-the-editor/goofball-idea/"
campaign7.video_url = "http://www.youtube.com/watch?v=64G5FfG2Xpg"
campaign7.funding_deadline = 1.week.ago
campaign7.funding_goal = 350000
campaign7.pitch = "Pitch"
campaign7.image_url = "http://barbarasantee.files.wordpress.com/2013/01/hoax.jpg"
campaign7.topic = Topic.find(4)
campaign7.donation_total = 550000
campaign7.status = "Funded"
campaign7.save
CampaignUser.create(campaign_id: campaign7.id, user_id: shiv.id, user_type: CREATOR)
CampaignUser.create(campaign_id: campaign7.id, user_id: eadon.id, user_type: DONOR, donation_amount: 10000)
CampaignUser.create(campaign_id: campaign7.id, user_id: dan.id, user_type: DONOR, donation_amount: 2000)
CampaignUser.create(campaign_id: campaign7.id, user_id: chris.id, user_type: DONOR, donation_amount: 20)
CampaignUser.create(campaign_id: campaign7.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
CampaignUser.create(campaign_id: campaign7.id, user_id: eadon.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign7.id, user_id: dan.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign7.id, user_id: chris.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign7.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
CampaignUser.create(campaign_id: campaign7.id, user_id: janelle.id, user_type: DONOR, donation_amount: 10000)
CampaignUser.create(campaign_id: campaign7.id, user_id: kristin.id, user_type: DONOR, donation_amount: 75000)
CampaignUser.create(campaign_id: campaign7.id, user_id: lisa.id, user_type: DONOR, donation_amount: 2000)
CampaignUser.create(campaign_id: campaign7.id, user_id: bob.id, user_type: DONOR, donation_amount: 500)

campaign8 = Campaign.new(title: "Save the Water. Save The Planet", short_blurb: "Save our most precious resource")
campaign8.location = "Arizona"
campaign8.cause_url = "http://savethewater.org/"
campaign8.video_url = "http://www.youtube.com/watch?v=IZNTnxhoU1k"
campaign8.funding_deadline = 2.weeks.ago
campaign8.funding_goal = 100000
campaign8.pitch = "Pitch"
campaign8.image_url = "http://primoplumbingcorp.com/images/save_water_save_life_by_grfixds.jpg"
campaign8.topic = Topic.find(4)
campaign8.donation_total = 75000
campaign8.status = "Unsuccessful"
campaign8.save
CampaignUser.create(campaign_id: campaign8.id, user_id: shiv.id, user_type: CREATOR)
CampaignUser.create(campaign_id: campaign8.id, user_id: eadon.id, user_type: DONOR, donation_amount: 10000)
CampaignUser.create(campaign_id: campaign8.id, user_id: dan.id, user_type: DONOR, donation_amount: 2000)
CampaignUser.create(campaign_id: campaign8.id, user_id: chris.id, user_type: DONOR, donation_amount: 20)
CampaignUser.create(campaign_id: campaign8.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
CampaignUser.create(campaign_id: campaign8.id, user_id: eadon.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign8.id, user_id: dan.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign8.id, user_id: chris.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign8.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
CampaignUser.create(campaign_id: campaign8.id, user_id: janelle.id, user_type: DONOR, donation_amount: 10000)
CampaignUser.create(campaign_id: campaign8.id, user_id: kristin.id, user_type: DONOR, donation_amount: 75000)
CampaignUser.create(campaign_id: campaign8.id, user_id: lisa.id, user_type: DONOR, donation_amount: 2000)
CampaignUser.create(campaign_id: campaign8.id, user_id: bob.id, user_type: DONOR, donation_amount: 500)

campaign9 = Campaign.new(title: "Fair Wages!", short_blurb: "Fair Minimum Wage Act of 2013")
campaign9.location = "New York"
campaign9.cause_url = "http://www.syp.org.uk/blog/wp-content/uploads/2012/09/One-Fair-Wage_red-logo.jpg"
campaign9.video_url = "http://www.youtube.com/watch?v=GJ6ciypGsGw"
campaign9.funding_deadline = Time.now() + 7.days
campaign9.funding_goal = 55000
campaign9.pitch = "Pitch"
campaign9.image_url = "http://www.syp.org.uk/blog/wp-content/uploads/2012/09/One-Fair-Wage_red-logo.jpg"
campaign9.topic = Topic.find(3)
campaign9.donation_total = 125000
campaign9.status = "Funded"
campaign9.save
CampaignUser.create(campaign_id: campaign9.id, user_id: shiv.id, user_type: CREATOR)
CampaignUser.create(campaign_id: campaign9.id, user_id: eadon.id, user_type: DONOR, donation_amount: 10000)
CampaignUser.create(campaign_id: campaign9.id, user_id: dan.id, user_type: DONOR, donation_amount: 2000)
CampaignUser.create(campaign_id: campaign9.id, user_id: chris.id, user_type: DONOR, donation_amount: 20)
CampaignUser.create(campaign_id: campaign9.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
CampaignUser.create(campaign_id: campaign9.id, user_id: eadon.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign9.id, user_id: dan.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign9.id, user_id: chris.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign9.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
CampaignUser.create(campaign_id: campaign9.id, user_id: janelle.id, user_type: DONOR, donation_amount: 10000)
CampaignUser.create(campaign_id: campaign9.id, user_id: kristin.id, user_type: DONOR, donation_amount: 75000)
CampaignUser.create(campaign_id: campaign9.id, user_id: lisa.id, user_type: DONOR, donation_amount: 2000)
CampaignUser.create(campaign_id: campaign9.id, user_id: bob.id, user_type: DONOR, donation_amount: 500)


campaign10 = Campaign.new(title: "FDA Warning Labels", short_blurb: "Warnings where we can see them!")
campaign10.location = "New York"
campaign10.cause_url = "http://www.change.org/petitions/fda-post-consumer-warnings-where-we-can-see-them"
campaign10.video_url = "www.youtube.com/watch?v=wlh-l3IxTLU"
campaign10.funding_deadline = Time.now + 4.days
campaign10.funding_goal = 50000
campaign10.pitch = "Every day, every person in " #this country faces potentially lethal food products. You and your loved ones are at risk every time you bring home groceries! Have you heard of the FDA Reportable Food Registry that lists products that have a “reasonable probability of causing serious adverse effects”? I had never even heard of it - and it cost my dog his life. Will my children, spouse, parents or friends be the next victims? Bella, Cali, Ginger, Heidi, Sampson, Sarge, Shelbie… These are just a few of the over 3,500 dogs reported to have been sickened or killed by chicken jerky dog treats – with untold thousands unreported. How could this happen – and still be happening? The answer: The warnings about this danger are ONLY available on the FDA website. My name is Ray Parker, and my beloved companion Sarge was a victim. Days after eating one of these treats, days of suffering, we had to make the heartbreaking decision to let him go. I had no idea that there was (and still is) a major ongoing investigation by the FDA - there was no warning on the package nor was there any warning posted on the shelf where they were displayed. Searching for answers, I went to my computer. I learned -- too late – that the FDA has been investigating jerky treats for years! The danger doesn't stop at pet treats. Prescription drugs, baby formula, black licorice and pet treats are just some of items that are currently under FDA Advisory. The only way to find these warnings is to search on-line. The average consumer doesn't compare their grocery list to the FDA website, nor should they be expected to do so. And if you don't have internet access, how are you supposed to learn what products might be putting your family at risk? The FDA has always claimed their hands are tied when it comes to warning consumers about reported products at the point of sale, but this is no longer true. In 2011, Congress finally enacted - and President Obama signed into law - the Food Safety Modernization Act (FSMA) which explicitly gives the FDA this authority. With just a simple piece of paper posted on store shelves, millions of American families can be spared the consequences of purchasing potentially dangerous products. There are so many loopholes that allow hazards to reach our homes and families. This is our last line of defense! I believe that the FDA has the responsibility to inform consumers of possible risks and we have the RIGHT to make informed decisions. A trip to the grocery store should not be deadly! If you agree, please join us in signing this petition."
campaign10.image_url = "http://d22r54gnmuhwmk.cloudfront.net/photos/8/jq/um/ykJqumfPUXvgxaD-556x313-noPad.jpg"
campaign10.topic = Topic.find(6)
campaign10.donation_total = 20000
campaign10.status = "Active"
campaign10.save
CampaignUser.create(campaign_id: campaign10.id, user_id: shiv.id, user_type: CREATOR)
CampaignUser.create(campaign_id: campaign10.id, user_id: dan.id, user_type: DONOR, donation_amount: 2000)
CampaignUser.create(campaign_id: campaign10.id, user_id: chris.id, user_type: DONOR, donation_amount: 20)
CampaignUser.create(campaign_id: campaign10.id, user_id: eadon.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign10.id, user_id: dan.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign10.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
CampaignUser.create(campaign_id: campaign10.id, user_id: janelle.id, user_type: DONOR, donation_amount: 10000)
CampaignUser.create(campaign_id: campaign10.id, user_id: lisa.id, user_type: DONOR, donation_amount: 2000)
CampaignUser.create(campaign_id: campaign10.id, user_id: bob.id, user_type: DONOR, donation_amount: 500)

campaign11 = Campaign.new(title: "Recognized Pharmacists", short_blurb: "Pharmacists are healthcare providers!")
campaign11.location = "Arizona"
campaign11.cause_url = "http://www.change.org/petitions/the-president-of-the-united-states-recognize-pharmacists-as-health-care-providers"
campaign11.video_url = "www.youtube.com/watch?v=wlh-l3IxTLU"
campaign11.funding_deadline = 1.week.ago
campaign11.funding_goal = 75000
campaign11.pitch = "Despite overwhelming evidence " #of the positive impact pharmacists can have on patient health, pharmacists are not recognized as healthcare providers under the Social Security Act and, therefore, cannot be paid by Medicare for therapy management and patient consultation services. The Social Security Act does recognize other healthcare professionals such as dieticians, nurse practitioners, physician assistants, nurse midwives, and clinical social workers. By changing the compensation structure allowed under Medicare, we can ensure that patients have access to the medication expertise of pharmacists. Studies have shown that when a pharmacist is directly involved in patient care, patients have fewer adverse drug reactions, experience improved outcomes, and healthcare costs are reduced."
campaign11.image_url = "http://today.uconn.edu/wp-content/uploads/2013/05/iS_7982994-prescrip-1.jpg"
campaign11.topic = Topic.find(6)
campaign11.donation_total = 40000
campaign11.status = "Unsuccessful"
campaign11.save
CampaignUser.create(campaign_id: campaign11.id, user_id: shiv.id, user_type: CREATOR)
CampaignUser.create(campaign_id: campaign11.id, user_id: eadon.id, user_type: DONOR, donation_amount: 10000)
CampaignUser.create(campaign_id: campaign11.id, user_id: dan.id, user_type: DONOR, donation_amount: 2000)
CampaignUser.create(campaign_id: campaign11.id, user_id: chris.id, user_type: DONOR, donation_amount: 20)
CampaignUser.create(campaign_id: campaign11.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
CampaignUser.create(campaign_id: campaign11.id, user_id: eadon.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign11.id, user_id: dan.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign11.id, user_id: chris.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign11.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
CampaignUser.create(campaign_id: campaign11.id, user_id: janelle.id, user_type: DONOR, donation_amount: 10000)
CampaignUser.create(campaign_id: campaign11.id, user_id: kristin.id, user_type: DONOR, donation_amount: 75000)
CampaignUser.create(campaign_id: campaign11.id, user_id: lisa.id, user_type: DONOR, donation_amount: 2000)
CampaignUser.create(campaign_id: campaign11.id, user_id: bob.id, user_type: DONOR, donation_amount: 500)

campaign12 = Campaign.new(title: "Label GMO's", short_blurb: "We have a right to know what we eat")
campaign12.location = "Ohio"
campaign12.cause_url = "http://justlabelit.org/"
campaign12.video_url = "http://www.youtube.com/watch?feature=player_embedded&v=TghIpBG5o3s"
campaign12.funding_deadline = Time.now + 4.days
campaign12.funding_goal = 50000
campaign12.pitch = "GE foods are patented inventions " #created primarily by six chemical companies (Monsanto, Dow, BASF, Bayer, Syngenta and DuPont). Most GE crops were designed to make it easier to spray herbicides on growing crops, killing weeds but leaving the genetically transformed crops unharmed. Growing these crops has resulted in substantial increases in the use of herbicides and insecticides, frequently in amounts that have never been tested for safety in humans, animals or other plants. Overall pesticide use on the three major GE crops grown in the U.S. – corn, soybeans and cotton – increased by more than 527 million pounds from 1996 to 2011. Most of the increase resulted from growing reliance on the herbicide glyphosate, the key ingredient in Monsanto’s Roundup, the world’s best selling weed killer. The U.S. Geological Survey has found that glyphosate is now a common component of the air and rain in the Midwest during spring and summer, and levels are rising in many aquatic ecosystems. In the arms race between growers and weeds, moreover, the weeds have fought back, and 21 types have evolved to become resistant to glyphosate. Called “superweeds,” they are emerging at an alarming rate and now flourish on more than 14 million acres where GE soy, corn and cotton crops grow. Several chemical companies are responding to this phenomenon by trying to design new GE seeds that tolerate stronger herbicides. Lack of Government Oversight The European Union, Japan, Russia and China are among the 60 nations worldwide that require GE foods to be labeled. The European Union has also banned cultivation of GE crops altogether, with only minor exceptions. In contrast, the United States has a “fast track” approval process for new GE food products. What’s more, the government does not use its own experts to make the key determination of whether a GE food is safe. Instead, the Food and Drug Administration (FDA) relies on the biotechnology companies to affirm that each new GE food they create is “not materially different in any respect relevant to food safety.” The FDA accepts this assurance and informs the company that it has a “…continuing responsibility…” to ensure that the GE food is safe, wholesome and in full compliance with regulatory requirements. Not surprisingly, GE crops have entered the U.S. food supply at an increasingly rapid pace over the last 16 years. And at the moment, industry has petitions pending for federal approval to market three new genetically engineered foods. They would extend GE foods into new sectors of the food supply while raising a host of novel concerns over human health and the environment. Currently awaiting approval are: Genetically Engineered Fish – salmon engineered to produce growth hormones year-round rather than seasonally, causing the fish to grow at twice the normal rate but reducing their levels of health promoting, long-chain omega-3 fatty acids. Genetically Engineered Fruit – apples genetically modified to produce enzymes that keep them from turning brown. No one knows what the altered genes might do to nutrition quality or safety. Genetically Engineered “2,4-D” Crops – to combat weeds that have developed resistance to Roundup (glyphosate), Dow is seeking approval of GE crops that are resistant to an older, high-risk herbicide. Many university weed scientists are speaking out against the dangerous notion that the best way to combat resistant weeds is to spray still more herbicide. In the U.S., there are already eight important weeds that are resistant to 2,4-D. Like the GE crops already in the food supply, these newly invented foods have not been subjected to independent safety testing, to clinical trials for possible effects on human health, to long-term tests for carcinogenicity or to testing for effects on fetal or child development. The chemical industry, meanwhile, has spent more than half a billion dollars ($572 million) in campaign contributions and lobbying expenditures over the last decade to advance its interests. One of industry’s primary goals is to prevent mandatory labeling of GE foods."
campaign12.image_url = "http://www.adressa.no/incoming/article6658219.ece/ALTERNATES/w980-default/sprek_Ill-GENFOOD.JPG"
campaign12.topic = Topic.find(6)
campaign12.donation_total = 33000
campaign12.status = "Active"
campaign12.save
CampaignUser.create(campaign_id: campaign12.id, user_id: shiv.id, user_type: CREATOR)
CampaignUser.create(campaign_id: campaign12.id, user_id: eadon.id, user_type: DONOR, donation_amount: 9000)
CampaignUser.create(campaign_id: campaign12.id, user_id: dan.id, user_type: DONOR, donation_amount: 2000)
CampaignUser.create(campaign_id: campaign12.id, user_id: chris.id, user_type: DONOR, donation_amount: 1000)
CampaignUser.create(campaign_id: campaign12.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
CampaignUser.create(campaign_id: campaign12.id, user_id: eadon.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign12.id, user_id: dan.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign12.id, user_id: chris.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign12.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
CampaignUser.create(campaign_id: campaign12.id, user_id: janelle.id, user_type: DONOR, donation_amount: 10000)
CampaignUser.create(campaign_id: campaign12.id, user_id: kristin.id, user_type: DONOR, donation_amount: 700)
CampaignUser.create(campaign_id: campaign12.id, user_id: lisa.id, user_type: DONOR, donation_amount: 2000)
CampaignUser.create(campaign_id: campaign12.id, user_id: bob.id, user_type: DONOR, donation_amount: 500)

campaign13 = Campaign.new(title: "Stop Wall Street Abuses!", short_blurb: "Comprehensive Reform to Wall Street.")
campaign13.location = "Florida"
campaign13.cause_url = "http://www.uspirg.org/issues/usp/reining-wall-street"
campaign13.video_url = "http://video.pbs.org/video/1177174194/"
campaign13.funding_deadline = Time.now() + 52.days
campaign13.funding_goal = 750000
campaign13.pitch = "In the wake of the worst financial " #crisis since the Great Depression, the President took on fierce lobbying and put in place some of the most sweeping financial reforms in history. These reforms were comprehensive and aimed at solving problems in our system exposed by the financial crisis. The President is fighting daily against special interests who want to roll back, delay, defund, and dismantle these reforms. Wall Street Reform did many things, including protecting and empowering consumers, and bringing transparency and oversight to previously unregulated and opaque markets and institutions. The Administration chose not to simply re-establish the Glass-Steagall separation between commercial banks and investment banks and opted instead for more comprehensive reforms for several reasons: Simply going back to Glass-Steagall would not have solved the failures of our modern financial system or prevented the financial crisis that led to the worst financial crisis in our lifetimes: It is important to remember that Glass-Steagall would not have prevented the most dramatic failures in 2008. Glass-Steagall would not have avoided the problematic activities of the institutions that defined this financial crisis -- Fannie and Freddie, Bear Stearns, Lehman Brothers, AIG, and Countrywide. What was required was a more comprehensive set of reforms to solve the roots of our crisis. As the President explained in his State of the Union address: I will not go back to the days when Wall Street was allowed to play by its own set of rules. The new rules we passed restore what should be any financial system's core purpose: getting funding to entrepreneurs with the best ideas, and getting loans to responsible families who want to buy a home, or start a business, or send their kids to college. In particular, the 'Volcker Rule' that the President fought to include in Wall Street Reform goes more directly at some of the risky behaviors behind the recent financial crisis. The Volcker Rule will ban banks from making risky bets when they're dealing with their customers' deposits. And Wall Street Reform goes further by: Creating a single consumer watchdog agency whose sole job is looking out for working families by protecting them from deceptive and unfair lending practices of mortgage brokers, payday lenders, and debt collectors. Requiring banks to hold more capital so that when they make a bad bet they pay for it, not taxpayers.  Preventing any financial company, like AIG, from posing such risk to our economy that we have no choice but for taxpayers to bail them out. We're doing this by forcing them to write in detail how, if they fail, they'll pay the bills; we're putting limits on the size of banks; and we're giving regulators an ability they've never had before to dismantle failing firms without sticking taxpayers with the bill. Increasing transparency by bringing the $600 trillion derivatives market -- which was at the center of the financial crisis -- and other trading out of the shadows. Holding CEO's accountable by taking back bonuses and compensation from failing CEOs, giving shareholders a voice on CEO pay, and protecting whistleblowers who speak out about wrongdoing on Wall Street. Thank you for signing the petition 'Re-establish and maintain the separation between investment banks and commercial banks' and for your participation in the We the People platform."
campaign13.image_url = "http://www.whitehouse.gov/sites/default/files/audio-video/video_thumbnail/061810_Wall_St_Reform.jpg"
campaign13.topic = Topic.find(3)
campaign13.donation_total = 40000
campaign13.status = "Active"
campaign13.save
CampaignUser.create(campaign_id: campaign13.id, user_id: brian.id, user_type: CREATOR)
CampaignUser.create(campaign_id: campaign13.id, user_id: eadon.id, user_type: DONOR, donation_amount: 3000)
CampaignUser.create(campaign_id: campaign13.id, user_id: dan.id, user_type: DONOR, donation_amount: 2000)
CampaignUser.create(campaign_id: campaign13.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
CampaignUser.create(campaign_id: campaign13.id, user_id: eadon.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign13.id, user_id: dan.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign13.id, user_id: chris.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign13.id, user_id: shiv.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign13.id, user_id: allon.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign13.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
CampaignUser.create(campaign_id: campaign13.id, user_id: janelle.id, user_type: DONOR, donation_amount: 10000)
CampaignUser.create(campaign_id: campaign13.id, user_id: kristin.id, user_type: DONOR, donation_amount: 75000)
CampaignUser.create(campaign_id: campaign13.id, user_id: lisa.id, user_type: DONOR, donation_amount: 2000)
CampaignUser.create(campaign_id: campaign13.id, user_id: bob.id, user_type: DONOR, donation_amount: 500)

campaign14 = Campaign.new(title: "Allow Tesla to Sell Directly To Consumers", short_blurb: "If Apple Can Sell Through its Stores Why not Tesla?")
campaign14.location = "New York"
campaign14.cause_url = "http://www.greenpeace.org/usa/en/campaigns/global-warming-and-energy/"
campaign14.video_url = "http://www.youtube.com/watch?v=m3BFVxb2M9o"
campaign14.funding_deadline = Time.now() + 30.days
campaign14.funding_goal = 1000000
campaign14.pitch = "Car dealers are upset with a car " #manufacturer willing to do whatever it takes to sell cars. Their problem? The cars don't go through local dealerships, which in some states is against the law.  That company, a certain electric vehicle manufacturer by the name of Tesla, isn't without allies, and has been known to put up a fight. A White House petition, voicing support for Tesla's direct-to-consumer sales, seeks an end to what it says are 'state legislators ... trying to unfairly protect automobile dealers in their states from competition.' Started by 'Ken,' a Tesla fan, the petition supports the company's sales model, which cuts dealers entirely out of the process. According to the petition, 'Tesla is providing competition, which is good for consumers.' Reached for comment by CNet, Ken, who requested to remain anonymous, said he owns some stock in Tesla, but doesn't work for the company. As of this writing, the petition had more than 35,000 signatures of the 100,000 required by July 5 to qualify for a response from the White House. Signatures or no, with regulations in 48 states banning or restricting the direct sales of automobiles, a quick fix may be hard to come by. According to CNBC, local auto dealers consistently are among the largest contributors to state legislators, and often generate a great deal of tax revenue. So the incentive for state-level change, at least on the legislative level, is low at best. Adds Forbes contributor Steve Blank, 'In these states it appears innovation be damned if it gets in the way of a rent seeker with a good lobbyist.' Of course, car dealers have a far different perspective. Bob Glaser, president of the North Carolina Automobile Dealers Association, told The Associated Press local car dealers have a vested interest in bettering their communities, while big car manufacturers do not. It's a consumer protection, explained Glaser, and why we say that is a dealer who has invested a significant amount of capital in a community is more committed to taking care of that area's customers. As the battle between Tesla and auto dealers inevitably heats up, the question may have best been distilled by an unnamed Tesla official, who asks: How do you sell the future if your business depends on the present?"
campaign14.image_url = "http://images.conceptcarz.com/imgxra/Tesla/2013-Tesla-Model-S_Sedan-Image-014.jpg"
campaign14.topic = Topic.find(12)
campaign14.donation_total = 450000
campaign14.status = "Active"
campaign14.save
CampaignUser.create(campaign_id: campaign14.id, user_id: shiv.id, user_type: CREATOR)
CampaignUser.create(campaign_id: campaign14.id, user_id: eadon.id, user_type: DONOR, donation_amount: 10000)
CampaignUser.create(campaign_id: campaign14.id, user_id: dan.id, user_type: DONOR, donation_amount: 2000)
CampaignUser.create(campaign_id: campaign14.id, user_id: chris.id, user_type: DONOR, donation_amount: 20)
CampaignUser.create(campaign_id: campaign14.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
CampaignUser.create(campaign_id: campaign14.id, user_id: eadon.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign14.id, user_id: dan.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign14.id, user_id: chris.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign14.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
CampaignUser.create(campaign_id: campaign14.id, user_id: janelle.id, user_type: DONOR, donation_amount: 10000)
CampaignUser.create(campaign_id: campaign14.id, user_id: kristin.id, user_type: DONOR, donation_amount: 75000)
CampaignUser.create(campaign_id: campaign14.id, user_id: lisa.id, user_type: DONOR, donation_amount: 2000)
CampaignUser.create(campaign_id: campaign14.id, user_id: bob.id, user_type: DONOR, donation_amount: 500)

campaign15 = Campaign.new(title: "NO. MORE. TAXES", short_blurb: "Stop Wasting Our Precious Tax Dollars")
campaign15.location = "New York"
campaign15.cause_url = "http://www.fixmypropertytaxes.com/sign-petition-lower-taxes.php"
campaign15.video_url = "www.youtube.com/watch?v=VxSMkBLpM90"
campaign15.funding_deadline = Time.now() + 20.days
campaign15.funding_goal = 1000000
campaign15.pitch = "The New NY Act empowers taxpayers to" #consolidate or dissolve a special district. New NY was passed by the New York State legislature in the spring of 2009. This law was initiated by the office of New York Attorney General Andrew Cuomo in an effort to reform the state’s local government fiscal inefficiencies and abuse. What is the difference between consolidation and dissolution? Consolidation is (1) the combination of two or more local government entities, which results in the termination of each of the consolidated entities and the creation of a new entity that has jurisdiction over the population, or (2) when one local government entity absorbs another, resulting in the termination of the absorbed entity and giving the remaining entity jurisdiction over the entire population. Dissolution is the complete termination of a local government entity, whose residents would then receive service from a different governing body, but not lose the service. How does the New NY Act work? The New NY Act enables a county, town, or taxpayers to initiate consolidation/dissolution efforts. Below is a summary of this method. For the complete New NY Act, click here. Taxpayer-led consolidation/dissolution must be approved by referendum, a special election where residents vote "yes" or "no" on a specific issue. A referendum is created with a signature petition that contains 10% of registered voters or 5,000 registered voters within the municipality, whichever is less. There is no timeframe or deadline to collect signatures. These signatures must be filed with and examined by the town clerk. Once approved, the clerk will issue a notice of approval to hold a referendum, which must be held 60-90 days after this notice. The referendum is approval only of the idea of dissolution or consolidation. If the referendum passes, an actual plan must be created by the local governing body itself, with input from the public. The governing body must meet within 30 days of the successful referendum and create a plan within 180 days of such meeting. This plan must then be approved through a second referendum. Before the second referendum, the proposed plan will be addressed at a public hearing(s), so the voters will be able to offer their opinions. If the referendum is successful, the plan is to be enacted. If the plan is rejected, a four-year moratorium is placed on this specific plan."
campaign15.image_url = "http://slacuw.com/old/flyers/tuition-prison-cartoon.jpg"
campaign15.topic = Topic.find(3)
campaign15.donation_total = 1450000
campaign15.status = "Active"
campaign15.save
CampaignUser.create(campaign_id: campaign15.id, user_id: shiv.id, user_type: CREATOR)
CampaignUser.create(campaign_id: campaign15.id, user_id: eadon.id, user_type: DONOR, donation_amount: 100000)
CampaignUser.create(campaign_id: campaign15.id, user_id: dan.id, user_type: DONOR, donation_amount: 200000)
CampaignUser.create(campaign_id: campaign15.id, user_id: chris.id, user_type: DONOR, donation_amount: 300000)
CampaignUser.create(campaign_id: campaign15.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
CampaignUser.create(campaign_id: campaign15.id, user_id: eadon.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign15.id, user_id: dan.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign15.id, user_id: chris.id, user_type: SUPPORTER)
CampaignUser.create(campaign_id: campaign15.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
CampaignUser.create(campaign_id: campaign15.id, user_id: janelle.id, user_type: DONOR, donation_amount: 10000)
CampaignUser.create(campaign_id: campaign15.id, user_id: kristin.id, user_type: DONOR, donation_amount: 75000)
CampaignUser.create(campaign_id: campaign15.id, user_id: lisa.id, user_type: DONOR, donation_amount: 2000)
CampaignUser.create(campaign_id: campaign15.id, user_id: bob.id, user_type: DONOR, donation_amount: 500)

# campaign16 = Campaign.new(title: "", short_blurb: "")
# campaign16.location = "New York"
# campaign16.cause_url = ""
# campaign16.video_url = ""
# campaign16.funding_deadline = Time.now() + 14.days
# campaign16.funding_goal = 
# campaign16.pitch = ""
# campaign16.image_url = ""
# campaign16.topic = Topic.find()
# campaign16.donation_total = 
# campaign16.status = "Active"
# campaign16.save
# CampaignUser.create(campaign_id: campaign16.id, user_id: shiv.id, user_type: CREATOR)
# CampaignUser.create(campaign_id: campaign16.id, user_id: eadon.id, user_type: DONOR, donation_amount: 100000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: dan.id, user_type: DONOR, donation_amount: 200000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: chris.id, user_type: DONOR, donation_amount: 300000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
# CampaignUser.create(campaign_id: campaign16.id, user_id: eadon.id, user_type: SUPPORTER)
# CampaignUser.create(campaign_id: campaign16.id, user_id: dan.id, user_type: SUPPORTER)
# CampaignUser.create(campaign_id: campaign16.id, user_id: chris.id, user_type: SUPPORTER)
# CampaignUser.create(campaign_id: campaign16.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
# CampaignUser.create(campaign_id: campaign16.id, user_id: janelle.id, user_type: DONOR, donation_amount: 10000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: kristin.id, user_type: DONOR, donation_amount: 75000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: lisa.id, user_type: DONOR, donation_amount: 2000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: bob.id, user_type: DONOR, donation_amount: 500)

# campaign16 = Campaign.new(title: "", short_blurb: "")
# campaign16.location = "New York"
# campaign16.cause_url = ""
# campaign16.video_url = ""
# campaign16.funding_deadline = Time.now() + 14.days
# campaign16.funding_goal = 
# campaign16.pitch = ""
# campaign16.image_url = ""
# campaign16.topic = Topic.find()
# campaign16.donation_total = 
# campaign16.status = "Active"
# campaign16.save
# CampaignUser.create(campaign_id: campaign16.id, user_id: shiv.id, user_type: CREATOR)
# CampaignUser.create(campaign_id: campaign16.id, user_id: eadon.id, user_type: DONOR, donation_amount: 100000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: dan.id, user_type: DONOR, donation_amount: 200000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: chris.id, user_type: DONOR, donation_amount: 300000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
# CampaignUser.create(campaign_id: campaign16.id, user_id: eadon.id, user_type: SUPPORTER)
# CampaignUser.create(campaign_id: campaign16.id, user_id: dan.id, user_type: SUPPORTER)
# CampaignUser.create(campaign_id: campaign16.id, user_id: chris.id, user_type: SUPPORTER)
# CampaignUser.create(campaign_id: campaign16.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
# CampaignUser.create(campaign_id: campaign16.id, user_id: janelle.id, user_type: DONOR, donation_amount: 10000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: kristin.id, user_type: DONOR, donation_amount: 75000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: lisa.id, user_type: DONOR, donation_amount: 2000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: bob.id, user_type: DONOR, donation_amount: 500)

# campaign16 = Campaign.new(title: "", short_blurb: "")
# campaign16.location = "New York"
# campaign16.cause_url = ""
# campaign16.video_url = ""
# campaign16.funding_deadline = Time.now() + 14.days
# campaign16.funding_goal = 
# campaign16.pitch = ""
# campaign16.image_url = ""
# campaign16.topic = Topic.find()
# campaign16.donation_total = 
# campaign16.status = "Active"
# campaign16.save
# CampaignUser.create(campaign_id: campaign16.id, user_id: shiv.id, user_type: CREATOR)
# CampaignUser.create(campaign_id: campaign16.id, user_id: eadon.id, user_type: DONOR, donation_amount: 100000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: dan.id, user_type: DONOR, donation_amount: 200000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: chris.id, user_type: DONOR, donation_amount: 300000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
# CampaignUser.create(campaign_id: campaign16.id, user_id: eadon.id, user_type: SUPPORTER)
# CampaignUser.create(campaign_id: campaign16.id, user_id: dan.id, user_type: SUPPORTER)
# CampaignUser.create(campaign_id: campaign16.id, user_id: chris.id, user_type: SUPPORTER)
# CampaignUser.create(campaign_id: campaign16.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
# CampaignUser.create(campaign_id: campaign16.id, user_id: janelle.id, user_type: DONOR, donation_amount: 10000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: kristin.id, user_type: DONOR, donation_amount: 75000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: lisa.id, user_type: DONOR, donation_amount: 2000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: bob.id, user_type: DONOR, donation_amount: 500)


# campaign16 = Campaign.new(title: "", short_blurb: "")
# campaign16.location = "New York"
# campaign16.cause_url = ""
# campaign16.video_url = ""
# campaign16.funding_deadline = Time.now() + 14.days
# campaign16.funding_goal = 
# campaign16.pitch = ""
# campaign16.image_url = ""
# campaign16.topic = Topic.find()
# campaign16.donation_total = 
# campaign16.status = "Active"
# campaign16.save
# CampaignUser.create(campaign_id: campaign16.id, user_id: shiv.id, user_type: CREATOR)
# CampaignUser.create(campaign_id: campaign16.id, user_id: eadon.id, user_type: DONOR, donation_amount: 100000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: dan.id, user_type: DONOR, donation_amount: 200000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: chris.id, user_type: DONOR, donation_amount: 300000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
# CampaignUser.create(campaign_id: campaign16.id, user_id: eadon.id, user_type: SUPPORTER)
# CampaignUser.create(campaign_id: campaign16.id, user_id: dan.id, user_type: SUPPORTER)
# CampaignUser.create(campaign_id: campaign16.id, user_id: chris.id, user_type: SUPPORTER)
# CampaignUser.create(campaign_id: campaign16.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
# CampaignUser.create(campaign_id: campaign16.id, user_id: janelle.id, user_type: DONOR, donation_amount: 10000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: kristin.id, user_type: DONOR, donation_amount: 75000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: lisa.id, user_type: DONOR, donation_amount: 2000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: bob.id, user_type: DONOR, donation_amount: 500)

# campaign16 = Campaign.new(title: "", short_blurb: "")
# campaign16.location = "New York"
# campaign16.cause_url = ""
# campaign16.video_url = ""
# campaign16.funding_deadline = Time.now() + 14.days
# campaign16.funding_goal = 
# campaign16.pitch = ""
# campaign16.image_url = ""
# campaign16.topic = Topic.find()
# campaign16.donation_total = 
# campaign16.status = "Active"
# campaign16.save
# CampaignUser.create(campaign_id: campaign16.id, user_id: shiv.id, user_type: CREATOR)
# CampaignUser.create(campaign_id: campaign16.id, user_id: eadon.id, user_type: DONOR, donation_amount: 100000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: dan.id, user_type: DONOR, donation_amount: 200000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: chris.id, user_type: DONOR, donation_amount: 300000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
# CampaignUser.create(campaign_id: campaign16.id, user_id: eadon.id, user_type: SUPPORTER)
# CampaignUser.create(campaign_id: campaign16.id, user_id: dan.id, user_type: SUPPORTER)
# CampaignUser.create(campaign_id: campaign16.id, user_id: chris.id, user_type: SUPPORTER)
# CampaignUser.create(campaign_id: campaign16.id, user_id: andrew.id, user_type: DONOR, donation_amount: 500)
# CampaignUser.create(campaign_id: campaign16.id, user_id: janelle.id, user_type: DONOR, donation_amount: 10000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: kristin.id, user_type: DONOR, donation_amount: 75000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: lisa.id, user_type: DONOR, donation_amount: 2000)
# CampaignUser.create(campaign_id: campaign16.id, user_id: bob.id, user_type: DONOR, donation_amount: 500)

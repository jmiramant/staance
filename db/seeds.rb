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


josh.admin = true
josh.save

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
p campaign3.status = "Funded"
p campaign3.save
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
campaign6.image_url = "http://www.phreshly-squeezed.net/blog/wp-content/uploads/2011/08/where-stand-kenneth-cole-pro-choice.jpg"
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


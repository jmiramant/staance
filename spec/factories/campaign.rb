

FactoryGirl.define do
  factory :campaign do
    title     "Campaign Title"
    image_url Faker::Internet.url
    video_url Faker::Internet.url
    cause_url Faker::Internet.url
    funding_deadline  Time.now + 1.week
    funding_goal  10000
    location "San Francisco"
    pitch Faker::Lorem.paragraph(12)
    short_blurb Faker::Lorem.paragraph
  end
end

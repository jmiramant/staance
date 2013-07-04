

FactoryGirl.define do
  factory :campaign do
    image_url Faker::Internet.url
    video_url Faker::Internet.url
    stance  true
    funding_deadline  Time.now
    funding_goal  10000
    pitch Faker::Lorem.paragraph
    description Faker::Lorem.sentence.titleize
  end
end

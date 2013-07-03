# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

TOPICS = [
"Community",
"Diversity",
"Economy",
"Entertainment & Culture",
"Environment",
"Guns & Crime",
"Health",
"Immigration",
"International",
"LGBTQQ",
"Military",
"Parenting",
"Politics",
"Science & Technology",
"Gender",
"Worker's Rights"]

TOPICS.each do |topic|
  Topic.create(title: topic)
end

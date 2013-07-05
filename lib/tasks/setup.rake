ActiveRecord::Base.logger = nil

namespace :db do
  desc "setup rails db"
  task :build => :environment do
    Rake::Task['db:drop'].execute
    Rake::Task['db:create'].execute
    Rake::Task['db:migrate'].execute
    Rake::Task['db:seed'].execute
  end

  desc "clear (destroy_all) databases"
  task :clear => :environment do
  	User.destroy_all
  	Campaign.destroy_all
  	CampaignUser.destroy_all
  	Topic.destroy_all
  	Authentication.destroy_all
  	puts "Databases cleared"
  end
end

ActiveRecord::Base.logger = nil

namespace :db do
  desc "setup rails db"
  task :build => :environment do
    Rake::Task['db:drop'].execute
    Rake::Task['db:create'].execute
    Rake::Task['db:migrate'].execute
    Rake::Task['db:seed'].execute
  end
end

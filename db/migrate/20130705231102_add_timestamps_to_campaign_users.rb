class AddTimestampsToCampaignUsers < ActiveRecord::Migration
  def change
    add_column :campaign_users, :created_at, :datetime
    add_column :campaign_users, :updated_at, :datetime
  end
end

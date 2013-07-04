class CreateCampaignUsers < ActiveRecord::Migration
  def change
    create_table :campaign_users do |t|
      t.references  :user, :campaign
      t.string  :user_type
    end

    add_index :campaign_users, [:campaign_id, :user_type, :user_id], unique: true
    
  end
end

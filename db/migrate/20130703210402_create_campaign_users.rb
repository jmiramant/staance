class CreateCampaignUsers < ActiveRecord::Migration
  def change
    create_table :campaign_users do |t|
    	t.references	:userable, polymorphic: true 
    	t.references	:campaign
      t.timestamps
    end

    add_index :campaign_users, [:campaign_id, :userable_id, :userable_type], unique: true
    
  end
end

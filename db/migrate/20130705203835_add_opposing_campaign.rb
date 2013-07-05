class AddOpposingCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :opposing_campaign_id, :integer
  end
end

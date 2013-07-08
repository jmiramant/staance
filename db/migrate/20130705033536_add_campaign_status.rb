class AddCampaignStatus < ActiveRecord::Migration
  def change
    add_column :campaigns, :status, :string, default: 'Pending'
  end
end

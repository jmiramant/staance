class IntegratePaymentAbility < ActiveRecord::Migration
  def change
    add_column :campaigns, :donation_total, :float, default: 0
    add_column :campaign_users, :donation_amount, :float
  end
end

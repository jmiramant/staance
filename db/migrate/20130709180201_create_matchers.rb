class CreateMatchers < ActiveRecord::Migration
  def change
    create_table :matchers do |t|
      t.string :name
      t.float :match_amount, default: 0
      t.string :logo_url
      t.text :description
      t.belongs_to :campaign_user
      t.integer :count
      t.timestamps
    end
  end
end

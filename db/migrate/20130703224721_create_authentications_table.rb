class CreateAuthenticationsTable < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.references :user
      t.string :provider, :uid, :token, :token_secret
    end
  end
end

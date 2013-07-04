class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
    	t.references	:topic
      t.string    :title
      t.string    :image_url
      t.string    :short_blurb
      t.string    :location
    	t.datetime	:funding_deadline
    	t.integer		:funding_goal
    	t.text			:pitch
      t.string    :video_url
      t.string    :cause_url
      t.boolean   :stance
      t.timestamps
    end
  end
end

class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
    	t.references	:topic
    	t.string		:image_url
    	t.string		:video_url
    	t.boolean		:stance
    	t.datetime	:funding_deadline
    	t.integer		:funding_goal
    	t.text			:pitch
    	t.text			:description

      t.timestamps
    end
  end
end

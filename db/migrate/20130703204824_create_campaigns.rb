class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
    	t.references	:topic
      t.string      :title, :image_url, :location, :video_url, :cause_url
    	t.datetime	  :funding_deadline
    	t.integer		  :funding_goal, default: 1
    	t.text			  :pitch, :short_blurb
    end
  end
end

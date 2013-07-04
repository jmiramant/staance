class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
    	t.references	:topic
      t.string      :title, :image_url, :short_blurb, :location, :video_url, :cause_url
    	t.datetime	  :funding_deadline
    	t.integer		  :funding_goal
    	t.text			  :pitch 
      t.boolean     :stance
    end
  end
end

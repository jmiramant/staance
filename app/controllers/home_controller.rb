class HomeController < ApplicationController
	include TaggingHelper
	include ResourceHelper  

	def index
    @user = User.new
    @trending = Campaign.trending
    @most_funded = Campaign.most_funded
    @most_successful = Campaign.most_successful
    @featured = Campaign.where(id: [5, 8, 14])
    @topics = Topic.all
  end

  def filter
    render json: render_to_string(partial: 'home/campaign_grid', 
                                  locals: { trending: Campaign.trending(6, params[:topic]),
                                            most_funded: Campaign.most_funded(6, params[:topic]),
                                            most_successful: Campaign.most_successful(6, params[:topic]) }).to_json
  end
end

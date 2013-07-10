class HomeController < ApplicationController
	include TaggingHelper
	include ResourceHelper

	def index
    @user = User.new
    @trending = trending_filter
    @most_funded = most_funded_filter
    @most_successful = most_successful_filter
    @featured = Campaign.where(id: [6, 8, 4])
    @topics = Topic.all
  end

  def filter
    render json: render_to_string(partial: 'home/campaign_grid', 
                                  locals: { trending: trending_filter(params[:topic]),
                                            most_funded: most_funded_filter(params[:topic]),
                                            most_successful: most_successful_filter(params[:topic]) }).to_json
  end
end

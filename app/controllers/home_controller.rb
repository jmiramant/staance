class HomeController < ApplicationController
  include TaggingHelper
  include HomeHelper

	def index
    @user = User.new
    @trending_campaigns_companies = trending_campaigns_filter
    @most_funded_companies = most_funded_filter
    @most_successful_campaigns = most_successful_filter
    @feature_campaigns = Campaign.where(id: [6, 8, 4])
  end
end


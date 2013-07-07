class HomeController < ApplicationController
  include TaggingHelper
  include HomeHelper

	def index
    @user = User.new
    @trending_campaigns = Campaign.where(id: trending_campaigns_filter)
    @most_funded_campaigns = Campaign.where(id: most_funded_filter) if most_funded_filter
    @most_successful_campaigns = Campaign.where(id: most_successful_filter) if most_successful_filter
	  @test_campaigns = Campaign.limit(3)
    @test_campaigns2 = Campaign.limit(6)
  end
end


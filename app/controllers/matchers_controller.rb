class MatchersController < ApplicationController
  include TaggingHelper
  include HomeHelper

  def index
    @user = User.new
    @trending = trending_filter
    @most_funded = most_funded_filter
    @most_successful = most_successful_filter
    @featured = Campaign.where(id: [6, 8, 4])
  end

  def new
    @camp_id = params[:id]
    @matcher = Matcher.new
    respond_to do |format|
      format.html { render partial: 'matchers/new'  }
    end
  end

  def create
    p params
    campaign = Campaign.find params[:matcher][:id]
    campaign_user = current_user.campaign_users.create :campaign_id: campaign.id, :user_type => MATCHER
    @new_matcher = Matcher.new( name:params[:matcher][:name], 
            match_amount: params[:matcher][:match_amount],
                logo_url: params[:matcher][:logo_url],
             description: params[:matcher][:description],
        campaign_user_id: campaign_user.id,
                   count: params[:matcher][:count],
                logo_url: params[:matcher][:logo_url])
    if @new_matcher.save
      
    else
      render json: {error: @new_matcher.errors.full_messages}.to_json, :status => :unprocessable_entity
    end
  end

end

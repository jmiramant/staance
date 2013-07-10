class MatchersController < ApplicationController
  
  def new
    @campaign = Campaign.find_by_id(params[:campaign_id])
    @matcher = Matcher.new
  end

  def create
    campaign = Campaign.find params[:campaign_id]
    campaign_user = current_user.campaign_users.create :campaign_id => campaign.id, :user_type => MATCHER
    new_matcher = Matcher.new( name:params[:matcher][:name], 
            match_amount: params[:matcher][:match_amount],
                logo_url: params[:matcher][:logo_url],
             description: params[:matcher][:description],
        campaign_user_id: campaign_user.id,
                   count: params[:matcher][:count],
                logo_url: params[:matcher][:logo_url])
    if new_matcher.save
      redirect_to "/campaigns/#{params[:campaign_id]}"
    else
      redirect_to :back
    end
  end

end


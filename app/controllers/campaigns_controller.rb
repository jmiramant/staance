class CampaignsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def new
    @campaign = Campaign.new
  end

  def create
    campaign = Campaign.create(params[:campaign])
    CampaignUser.create(campaign_id: campaign.id, user_id: current_user.id, user_type: "Creator")
    redirect_to "index"
  end

  def destroy
  end

  def show
  end

  def update
  end

end

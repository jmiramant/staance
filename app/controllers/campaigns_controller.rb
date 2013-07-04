class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
  end

  def new
    @campaign = Campaign.new
  end

  def create
    campaign = Campaign.create(params[:campaign])
    CampaignUser.create(campaign_id: campaign.id, user_id: current_user.id, user_type: "Creator")
    redirect_to root_path
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

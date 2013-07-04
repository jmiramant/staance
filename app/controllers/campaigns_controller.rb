class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
    @topics = Topic.all
  end

  def new
    @campaign = Campaign.new
  end

  def create
    campaign = Campaign.create(params[:campaign])
    CampaignUser.create(campaign_id: campaign.id, user_id: current_user.id, :user_type => "Creator")
    redirect_to campaign
  end

  def show
    @campaign = Campaign.find_by_id(params[:id])
  end

  def destroy
  end

  def update
  end

  def destroy
  end
end

class CampaignsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @campaigns = Campaign.all
    @topics = Topic.all
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.create(params[:campaign])
    if @campaign.valid?
      CampaignUser.create(campaign_id: @campaign.id, user_id: current_user.id, :user_type => "Creator")
      redirect_to @campaign
    else
      @errors = @campaign.errors.full_messages
      render :new
    end
  end

  def show
    @campaign = Campaign.find_by_id(params[:id])
  end

  def update
  end

  def destroy
  end

end


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
      campaign_user = CampaignUser.create(campaign_id: @campaign.id, user_id: current_user.id, :user_type => CREATOR)
      ScheduledWorker.perform_at(@campaign.funding_deadline, @campaign.id)
      redirect_to @campaign
    else
      @errors = @campaign.errors.full_messages
      render :new
    end
  end

  def show
    session.delete(:campaign_id) if session[:campaign_id]
    @support = current_user.supported_campaigns if current_user
    @campaign = Campaign.find_by_id(params[:id])
    @ids = CampaignUser.where(campaign_id: @campaign.id, user_type: "Supporter").pluck("user_id")
    # @video = UrlToMediaTag.convert(@campaign.video_url, width: 540, height: 320)
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update_attributes(params[:campaign])
      render :show, :alert => "Campaign Suspended"
    else
      render :edit, :alert => "Update Failed"
    end
  end

  def destroy
    campaign = Campaign.find(params[:id])
    campaign.update_attribute(status, SUSPENDED)
    redirect_to :index

  end

  def filter_topic
    topic = Topic.find_by_title(params[:topic])
    p campaigns = Campaign.where(topic_id: topic.id)
    render json: render_to_string(partial: 'filtered_opp_campaigns', locals: { camp: campaigns }).to_json
  end
end


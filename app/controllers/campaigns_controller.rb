class CampaignsController < ApplicationController
  before_filter :auth_user, :except => [:index, :show]

  def index
    @campaigns = Campaign.where(status: ACTIVE)
    @topics = Topic.all
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.create(params[:campaign])
    if @campaign.valid?
      session[:campaign_build] = @campaign.id
      CampaignUser.create(campaign_id: @campaign.id, user_id: current_user.id, :user_type => CREATOR)
      render json: {campaign_id: @campaign.id }.to_json
    else
      render json: {error: @campaign.errors.full_messages}.to_json, :status => :unprocessable_entity
    end
  end

  def show
    session.delete(:campaign_id) if session[:campaign_id]
    @support = current_user.supported_campaigns if current_user
    @campaign = Campaign.find_by_id(params[:id])
    ids = CampaignUser.where(campaign_id: @campaign.id, user_type: SUPPORTER).pluck("user_id")
    @supporters = []
    @supporters = ids.map { |id| User.find(id)}
    @video = UrlToMediaTag.convert(@campaign.video_url, width: 540, height: 320)
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update_attributes(params[:campaign])
      render :show, :alert => "Campaign Updated"
    else
      render :edit, :alert => "Update Failed"
    end
  end

  def destroy
    campaign = Campaign.find(params[:id])
    campaign.update_attribute(:status, SUSPENDED)
    redirect_to campaigns_path, alert: "Campaign Deleted" 
  end

  def filter_topic
    topic = Topic.find_by_title(params[:topic])
    p campaigns = Campaign.where(topic_id: topic.id)
    render json: render_to_string(partial: 'filtered_opp_campaigns', locals: { camp: campaigns }).to_json
  end

  def editable_form
    @campaign = Campaign.find_by_id(session[:campaign_build])
    @campaign.update_attribute('pitch', params[:form])
    respond_to do |format|
      if @campaign.save
        format.js { render partial: 'campaigns/editable_form' }
      else
        format.json { render json: @campaign.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end
  
  def finalize_campaign
    @campaign = Campaign.find_by_id(session[:campaign_build])
    @campaign.update_attributes(params[:campaign])
    @campaign.update_attribute(:status, ACTIVE)
    if @campaign.save
      ScheduledWorker.perform_at(@campaign.funding_deadline, @campaign.id)
      # UserMailer.campaign_new_email(current_user, @campaign).deliver
      # session.delete(:campaign_build)
     render nothing: true
    else
      render json: {:error => @campaign.errors.full_messages}.to_json, :status => :unprocessable_entity
    end
  end
end


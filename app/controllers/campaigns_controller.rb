class CampaignsController < ApplicationController
  include CreateFormValidation
  include CampaignHelper

  before_filter :auth_user, :except => [:index, :show]
  before_filter :check_same_user, :only => [:edit, :update, :destroy]

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
    @campaign = Campaign.find_by_id(params[:id])
    @campaign_show = CampaignHelper.render_objects_for_view(current_user, @campaign)
  end

  def edit
  end

  def update
    if @campaign.update_attributes(params[:campaign])
      session[:campaign_build] = @campaign.id
      render json: { campaign_id: @campaign.id, campaign_pitch: @campaign.pitch }.to_json
    else
      render json: {error: @campaign.errors.full_messages}.to_json, :status => :unprocessable_entity
    end
  end

  def destroy
    @campaign.update_attribute(:status, SUSPENDED)
    redirect_to current_user, alert: "Campaign Deleted" 
  end

  def filter_topic
    topic = Topic.find_by_title(params[:topic])
    campaigns = Campaign.where(topic_id: topic.id)
    render json: render_to_string(partial: 'filtered_opp_campaigns', locals: { camp: campaigns }).to_json
  end

  def editable_form
    if params[:form].length < 520
      errors = "Pitch must be a minimum length of 520 characters"
      render json: errors.to_json 
    else
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
  end
  
  def finalize_campaign
    errors = CreateFormValidation.form_three_validations(params[:campaign])
    if errors.count == 1
      @campaign = Campaign.find_by_id(session[:campaign_build])
      @campaign.update_attributes(params[:campaign])
      @campaign.update_attribute(:status, ACTIVE)
      if @campaign.save
        ScheduledWorker.perform_at(@campaign.funding_deadline, @campaign.id)
        # UserMailer.campaign_new_email(current_user, @campaign).deliver
        session.delete(:campaign_build)
        render nothing: true
      else
        render json: {:error => @campaign.errors.full_messages}.to_json, :status => :unprocessable_entity
      end
    else
      render json: errors.to_json
    end
  end

  def activate
    campaign = Campaign.find(params[:id])
    new_status = (campaign.status == PENDING) ? ACTIVE : PENDING
    campaign.update_attribute(:status, new_status)
    render json: new_status.to_json
  end

  def support
    camp = Campaign.find_by_id(params[:id])
    CampaignUser.create(campaign_id: camp.id, user_id: current_user.id, :user_type => SUPPORTER)
    count = camp.campaign_users.where(user_type: SUPPORTER).count
    render json: count.to_s.to_json
  end

  def check_support
    params[:path].match(/(\d)/)
    campaign_id = $1.to_i
    if CampaignUser.where('user_id is ? and campaign_id is ? and user_type is ?', current_user.id, campaign_id, SUPPORTER)
      render json: true.to_json
    else
      render json: false.to_json
    end
  end

  protected
    def check_same_user
      @campaign = Campaign.find(params[:id])
      campaign_user = CampaignUser.where('campaign_id = ? and user_type = ?', @campaign.id, "Creator").first
      creator = User.find(campaign_user.user_id)
      unless creator == current_user
        flash[:alert] = "You can only edit campaigns that you created."
        redirect_to @campaign
      end
    end
end


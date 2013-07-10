class CampaignsController < ApplicationController
  include CreateFormValidation
  include CampaignHelper

  before_filter :auth_user, :except => [:index, :show]
  before_filter :check_same_user, :only => [:edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(params[:campaign])
    # @campaign.campaign_users.build :user => current_user, :user_type => CREATOR
    if @campaign.save
      session[:campaign_build] = @campaign.id
      # remove next line if using Shadi's logic
      CampaignUser.create(campaign_id: @campaign.id, user_id: current_user.id, :user_type => CREATOR)
      render json: {campaign_id: @campaign.id }.to_json
    else
      render json: {error: @campaign.errors.full_messages}.to_json, :status => :unprocessable_entity
    end
  end

  def show
    session.delete(:campaign_id) if session[:campaign_id]
    @campaign = Campaign.find_by_id(params[:id])
    @opposing_campaign = Campaign.find_by_id(@campaign.opposing_campaign_id) if @campaign.opposing_campaign_id
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
      
      @related_campaigns = @campaign.related_campaigns
      respond_to do |format|
        if @campaign.save
          # Shadi wants us to remove dependency of using in Ruby/Rails... do it?
          format.js { render partial: 'campaigns/editable_form' }
          format.json { render json: @related_campaigns }
        else
          format.json { render json: @campaign.errors.full_messages, status: :unprocessable_entity }
        end
      end
    end
  end
  
  def finalize_campaign
    errors = CreateFormValidation.form_three_validations(params[:campaign])
    if errors.blank?
      @campaign = Campaign.find_by_id(session[:campaign_build])
      @campaign.update_attributes(params[:campaign])
      if @campaign.save
        @campaign.schedule_stripe_payment
        UserMailer.campaign_new_email(current_user, @campaign).deliver
        session.delete(:campaign_build)
        render nothing: true
      else
        render json: {:error => @campaign.errors.full_messages}.to_json, :status => :unprocessable_entity
      end
    else
      render json: errors.to_json
    end
  end

  # change name of route/method to reflect ability to change state between ACTIVE and PENDING
  def activate
    campaign = Campaign.find(params[:id])
    # create campaign.toggle_status method in Campaign model
    new_status = (campaign.status == PENDING) ? ACTIVE : PENDING
    campaign.update_attribute(:status, new_status)
    render json: new_status.to_json
  end

  def support
    camp = Campaign.find_by_id(params[:id])
    camp.add_supporter(current_user)
    count = camp.supporters.count
    render json: count.to_s.to_json
  end

  def unsupport
    camp = Campaign.find_by_id(params[:id])
    camp.remove_supporter(current_user)
    count = camp.supporters.count
    render json: count.to_s.to_json
  end

  def check_support
    # is there a better way to get the campaign_id from the page and pass it to this controller?
    params[:path].match(/(\d)/)
    campaign_id = $1.to_i
    # create campaign.supporter?(user) method in Campaign model
    supporter = CampaignUser.where('user_id = ? and campaign_id = ? and user_type = ?', current_user.id, campaign_id, SUPPORTER)
    # user method as boolean, i.e. campaign.supporter?(user) should equal true or false for conditional statement below
    # if campaign.supporter?(user) then...
    if supporter.length == 0
      render json: false
    else
      render json: true
    end
  end

  protected

    def check_same_user
      @campaign = Campaign.find(params[:id])
      creator = @campaign.creator
      unless creator == current_user
        flash[:alert] = "You can only edit campaigns that you created."
        redirect_to @campaign
      end
    end
    
end


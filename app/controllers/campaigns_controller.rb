class CampaignsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  skip_before_filter :verify_authenticity_token, only: :process_card

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
    @support = current_user.supported_campaigns if current_user
    @campaign = Campaign.find_by_id(params[:id])
    @ids = CampaignUser.where(campaign_id: @campaign.id, user_type: "Supporter").pluck("user_id")
  end

  def update
  end

  def destroy
  end

  def donate
    campaign = Campaign.find(params[:campaign_id])
    campaign_user = CampaignUser.find_or_create_by_campaign_id_and_user_id_and_user_type(campaign.id, current_user.id, 'Donator')
    campaign.donation_total -= campaign_user.donation_amount if campaign_user.donation_amount
    campaign_user.donation_amount = params[:donation].to_f
    campaign_user.save
    campaign.donation_total += params[:donation].to_f
    campaign.save
    redirect_to add_cc_path
  end

  def add_cc
    render :add_cc
  end

  def process_card
    token = params[:stripeToken]
    customer = Stripe::Customer.create(card: token, description: current_user.email)
    user = User.find(current_user.id)
    user.stripe_id = customer.id
    user.save 
    redirect_to root_path
  end

end

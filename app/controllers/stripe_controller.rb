class StripeController < ApplicationController
  include StripeHelper

  before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token, only: :process_card

  def donate
    campaign = Campaign.find(params[:campaign_id])
    donation = params[:donation].to_f
    update_donation_total(campaign, donation)
    session[:campaign_id] = campaign.id
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
    redirect_to Campaign.find(session[:campaign_id])
  end
end

class UsersController < ApplicationController
  include HomeHelper
  before_filter :auth_user, except: :multiauth

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    supports = CampaignUser.where(user_type: SUPPORTER, user_id: @user.id).pluck("campaign_id")
    @campaigns = []
    if supports
      supports.each do |campaign_id|
        @campaigns << Campaign.find(campaign_id)
      end
    end
  end

  def multiauth
    redirect_to current_user if user_signed_in?
  end
end

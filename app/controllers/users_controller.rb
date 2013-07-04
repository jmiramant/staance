class UsersController < ApplicationController
  
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    supports = CampaignUser.where(user_type: "Supporter", user_id: @user.id).pluck("campaign_id")
    @campaigns = []
    if supports
      supports.each do |campaign_id|
        @campaigns << Campaign.find(campaign_id)
      end
    end
  end
end

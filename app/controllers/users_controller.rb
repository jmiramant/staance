class UsersController < ApplicationController
  include ResourceHelper
  before_filter :auth_user, except: :multiauth

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @profile_name = @user.name.blank? ? "Your Name" : @user.name 
    @campaign_example = Campaign.find_by_id(4).nil? ? "#" : Campaign.find(4)
    # create user.supported_campaigns method in User model, i.e. @campaigns = @user.supported_campaigns
    # remove all this logic below and move to method (Shadi already did this for us --> check that it works)
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

class UsersController < ApplicationController
  include ResourceHelper
  before_filter :auth_user, except: :multiauth

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @profile_name = @user.name.blank? ? "Your Name" : @user.name 
    @supported_campaigns = @user.supported_campaigns
    @donated_campaigns = @user.donated_campaigns
    @active_campaigns = @user.active_campaigns
    @pending_campaigns = @user.pending_campaigns
  end

  def multiauth
    redirect_to current_user if user_signed_in?
  end
end

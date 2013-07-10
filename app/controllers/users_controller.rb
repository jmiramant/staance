class UsersController < ApplicationController
  include HomeHelper
  before_filter :auth_user, except: :multiauth

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @campaigns = @user.supported_campaigns
  end

  def multiauth
    redirect_to current_user if user_signed_in?
  end
end

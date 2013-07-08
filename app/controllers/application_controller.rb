class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(user)
    user_path(user)
  end

  def auth_user
    unless user_signed_in?
      flash[:alert] = "You need to sign in or sign up before continuing."
      redirect_to multiauth_path
    end
  end
end

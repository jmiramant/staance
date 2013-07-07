class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(user)
    user_url(user)
  end

  def auth_user
    redirect_to multiauth_url unless user_signed_in?
  end
end

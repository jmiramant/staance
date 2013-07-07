class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(user)
    user_url(user)
  end

  def auth_user
    @errors = ["You need to sign in or sign up before continuing."]
    render "users/multiauth" unless user_signed_in?
  end
end

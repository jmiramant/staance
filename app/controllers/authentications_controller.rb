class AuthenticationsController < Devise::OmniauthCallbacksController
  include AuthenticationsHelper

  def all
    omni = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])
    if authentication
      sign_in_user(authentication)
    elsif current_user
      add_new_oauth(authentication, omni)
    else
      create_new_user(omni)
    end
  end

  alias_method :twitter, :all
  alias_method :facebook, :all
end

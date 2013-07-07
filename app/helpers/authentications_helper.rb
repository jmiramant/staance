module AuthenticationsHelper
  def sign_in_user(authentication)
    flash[:notice] = "Logged in!"
    sign_in_and_redirect User.find(authentication.user_id)
  end

  def add_new_oauth(authentication, omni)
    token = omni['credentials'].token
    token_secret = omni['credentials'].secret
    current_user.authentications.create!(provider: omni['provider'], uid: omni['uid'], 
                                         token: token, token_secret: token_secret)
    flash[:notice] = "Authentication successful"
    sign_in_and_redirect current_user
  end

  def create_new_user(omni)
    user = User.new
    user.email = omni['extra']['raw_info'].email if omni['extra']['raw_info'].email
    user.apply_omniauth(omni)
    if user.save 
      flash[:notice] = "Logged in!"
      sign_in_and_redirect user
    elsif omni['provider'] == 'twitter' && omni['extra']['raw_info']['screen_name'] && omni['extra']['raw_info'].created_at
      session[:omniauth] = omni.except('extra')
      redirect_to new_user_registration_path
    else
      session[:omniauth] = omni.except('extra')
      redirect_to multiauth_path
    end
  end
end

class RegistrationsController < Devise::RegistrationsController
  include ResourceHelper
  before_filter :auth_user, except: [:new, :create, :multiauth]
  before_filter :twitter_auth, only: :new
  
  def build_resource(*args)
    super
    if session[:omniauth]
      @user.apply_omniauth(session[:omniauth])  
      @user.valid?
    end
  end

  def new
    @twitter = true
    super
  end

  def create
    build_resource

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      flash[:alert] = resource.errors.full_messages
      redirect_to multiauth_path
    end
    session.delete(:omniauth) unless @user.new_record?
  end

  def multiauth
    redirect_to current_user if user_signed_in?
  end

  protected

    def twitter_auth
      redirect_to multiauth_path unless session[:omniauth]
    end

    def after_update_path_for(user)
      user_path(user)
    end
end 

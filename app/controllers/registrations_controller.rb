class RegistrationsController < Devise::RegistrationsController
  def build_resource(*args)
    super
    if session[:omniauth]
      @user.apply_omniauth(session[:omniauth])
      @user.valid?
    end
  end

  def create
    super
    session.delete(:omniauth) unless @user.new_record?
  end
end 

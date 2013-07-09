class PasswordsController < Devise::PasswordsController
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)

    if successfully_sent?(resource)
      flash[:alert] = "Reset password instructions sent."
      respond_with({}, :location => after_sending_reset_password_instructions_path_for(resource_name))
    else
      respond_with(resource)
    end
  end

  protected
    def after_sending_reset_password_instructions_path_for(resource_name)
      multiauth_path if is_navigational_format?
    end
end

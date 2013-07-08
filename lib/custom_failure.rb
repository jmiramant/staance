class CustomFailure < Devise::FailureApp
  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end

  def redirect
    store_location!
    flash[:alert] = "Invalid email or password."
    redirect_to multiauth_path
  end
end

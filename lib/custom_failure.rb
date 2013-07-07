class CustomFailure < Devise::FailureApp
  def redirect_url
    if warden_options[:scope] == :user
      multiauth_path
    else
      multiauth_path
    end
  end

  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end

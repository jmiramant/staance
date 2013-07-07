class SessionsController < Devise::SessionsController
  before_filter :auth_user
end

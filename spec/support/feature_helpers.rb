require 'spec_helper'
include Warden::Test::Helpers

module FeatureHelpers
  def login(user)
    login_as user, scope: :user
  end
end

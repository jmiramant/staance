PoliticalKickstarter::Application.routes.draw do
  devise_for :users

  root :to => "campaigns#index"
end

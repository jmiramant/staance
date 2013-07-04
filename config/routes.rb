PoliticalKickstarter::Application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => 'authentications', :registrations => 'registrations'}

  root :to => "campaigns#index"
  resources :campaigns
  resources :users, only: [:index, :show]

  get 'tags/:tag', to: 'campaigns#index', as: :tag
end

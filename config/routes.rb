PoliticalKickstarter::Application.routes.draw do
  devise_for :users, controllers: {:omniauth_callbacks => 'authentications', :registrations => 'registrations'}
  resources :users, only: [:index, :show]
  resources :campaigns
  resources :topics, only: [:index, :show]
  resources :campaign_users, only: :create
  # get 'tags/:tag', to: 'campaigns#index', as: :tag  ==>  uncomment to enable search by tags

  root :to => "campaigns#index"

  match '/donate' => "campaigns#donate", action: 'post'
  match '/add_cc' => "campaigns#add_cc", action: 'get'
  match '/process_card' => "campaigns#process_card", action: 'post'
end

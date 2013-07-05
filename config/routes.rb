PoliticalKickstarter::Application.routes.draw do
  devise_for :users, controllers: {:omniauth_callbacks => 'authentications', :registrations => 'registrations'}
  resources :users, only: [:index, :show]
  resources :campaigns
  resources :topics, only: [:index, :show]
  resources :campaign_users, only: :create
  match '/donate' => "stripe#donate", action: 'post'
  match '/add_cc' => "stripe#add_cc", action: 'get'
  match '/process_card' => "stripe#process_card", action: 'post'
  match '/' => "home#index", action: 'get'
  match '/filter_topic/:topic' => "campaigns#filter_topic", action: 'post'
  # get 'tags/:tag', to: 'campaigns#index', as: :tag  ==>  uncomment to enable search by tags

  root :to => "home#index"
end

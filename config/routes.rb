PoliticalKickstarter::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  post '/campaigns/editable_form' => "campaigns#editable_form"
  post '/campaigns/finalize_campaign' => "campaigns#finalize_campaign"
  put '/campaigns/finalize_campaign' => "campaigns#finalize_campaign"
  match 'campaign/support' => "campaigns#support", action: 'post' 

  devise_for :users, controllers: {:omniauth_callbacks => 'authentications', 
                                   :registrations => 'registrations',
                                   :sessions => 'sessions'}
  resources :users, only: [:show]
  resources :campaigns
  resources :topics, only: [:index]
  resources :campaign_users, only: :create
  match '/donate' => "stripe#donate", action: 'post'
  match '/add_cc' => "stripe#add_cc", action: 'get'
  match '/process_card' => "stripe#process_card", action: 'post'
  match '/' => "home#index", action: 'get'
  match '/filter_topic/:topic' => "campaigns#filter_topic", action: 'post'
  match '/multiauth' => "users#multiauth", action: 'get'
  match '/home/filter' => "home#filter", action: 'post'

  # get 'tags/:tag', to: 'campaigns#index', as: :tag  ==>  uncomment to enable search by tags
  root :to => "home#index"
end

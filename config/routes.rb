PoliticalKickstarter::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users, controllers: {:omniauth_callbacks => 'authentications', :registrations => 'registrations'}
  resources :users, only: [:index, :show]
  resources :campaigns
  resources :topics, only: [:index, :show]
  resources :campaign_users, only: :create
  match '/editable_form' => "campaigns#editable_form", action: 'post'
  match '/donate' => "stripe#donate", action: 'post'
  match '/add_cc' => "stripe#add_cc", action: 'get'
  match '/process_card' => "stripe#process_card", action: 'post'
  match '/' => "home#index", action: 'get'
  match '/filter_topic/:topic' => "campaigns#filter_topic", action: 'post'
  match '/multiauth' => "users#multiauth", action: 'get'
  # get 'tags/:tag', to: 'campaigns#index', as: :tag  ==>  uncomment to enable search by tags
  root :to => "home#index"
end

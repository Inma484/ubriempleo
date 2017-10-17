Rails.application.routes.draw do
  resources :articles do
  	resources :comments
  end
  devise_for :users
  root :to => 'welcome#index'
 end

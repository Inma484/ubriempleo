Rails.application.routes.draw do

  resources :attachments
  resources :posts

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks",
  									registrations: "registrations"}
  resources :user

  get 'welcome/index'
  post "user/follow"

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

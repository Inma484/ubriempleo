Rails.application.routes.draw do
  resources :curriculums 
  devise_for :users, controllers: {registrations: "registrations"}
  resources :posts
  resources :empresas
  resources :categories

  root to: 'welcome#index', constraints: lambda { |request| !request.env['warden'].user }

  root :to =>'posts#index', as:"admin_root", constraints: lambda{|request| request.env["warden"].user.role == "admin" }

  root :to =>'posts#index', as:"empresa_root", constraints: lambda{|request| request.env["warden"].user.role == "empresa" } 

  root :to =>'posts#index', as:"trabajador_root", constraints: lambda{|request| request.env["warden"].user.role == "trabajador" } 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end

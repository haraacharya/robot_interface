CourseProject::Application.routes.draw do
  
  ActiveAdmin.routes(self)

  root to: "main#index"

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users, :path => 'accounts'

  
  match "info" => "main#info"
  match "faq" => "main#faq"

  match "client" => "main#client"
  resources :userdetails
  resources :main, only: [:new]
end

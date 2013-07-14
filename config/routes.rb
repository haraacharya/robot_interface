CourseProject::Application.routes.draw do
  
  ActiveAdmin.routes(self)


  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
    	resources :users
    	resources :userdetails do
        post "userdetails/button_action"
      end  
    end
  end

  root to: "main#index"

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users, :path => 'accounts'

  
  match "info" => "main#info"
  match "faq" => "main#faq"

  match "client" => "main#client"
  
  resources :userdetails do
    post "userdetails/button_action"
  end  
  resources :main, only: [:new]
end

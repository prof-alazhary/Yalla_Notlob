Rails.application.routes.draw do


  get 'notifications/index'

 resources :friendships
   resources :notifications

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :friends
  resources :users do
    collection do
      # get :autocomplete
    end
      resources :orders do
            resources :order_details
        end
      resources :groups

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  post '/add_member' => 'groups#add_member'
  post '/get_all_members' => 'groups#get_all_members'
end

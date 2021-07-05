Rails.application.routes.draw do

  get 'comments/new'
  get 'comments/create'
  get 'comments/destroy'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :sessions => "users/sessions", registrations: "users/registrations" }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "posts#index"
  get "profile", to: "users#show"
  
  resources :posts do
    resources :comments
    member do
      put "like" => "posts#like"
    end
  end

  as :user do
    get 'profile', :to => 'devise/registrations#edit', :as => :user_root
  end


  #Admin Actions
  get '/adm', to: 'admins#index', :as => :admin_view
  get '/adm/ban/:id', to: 'admins#ban_user', :via => :get, :as => :admin_ban_user
  get '/adm/unban/:id', to: 'admins#unban_user', :via => :get, :as => :admin_unban_user
  get '/adm/admin/:id', to: 'admins#admin_user', :via => :get, :as => :admin_admin_user
  get '/adm/unadmin/:id', to: 'admins#unadmin_user', :via => :get, :as => :admin_unadmin_user
  get '/adm/destroy/:id', to: 'admins#destroy_user', :via => :get, :as => :admin_destroy_user
end

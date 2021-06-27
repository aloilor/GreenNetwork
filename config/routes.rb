Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/create'
  get 'comments/destroy'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "posts#index"
  get "profile", to: "users#show"
  
  resources :posts do
    resources :comments
    member do
      put "like" => "posts#like"
    end
  end
end

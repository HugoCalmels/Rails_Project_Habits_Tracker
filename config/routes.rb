Rails.application.routes.draw do

  root to: "home#index"
  devise_for :users, :path_prefix => 'd'
  resources :users, only: [:show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

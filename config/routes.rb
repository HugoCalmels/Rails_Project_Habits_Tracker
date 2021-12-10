Rails.application.routes.draw do

  root to: "home#index"
  devise_for :users, :path_prefix => 'd'
  resources :users, only: [:show, :index] do 
    resources :cycles, param: :title, only: [:show, :index] do 
      get :stats
      resources :good_habits
      resources :bad_habits
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

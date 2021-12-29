Rails.application.routes.draw do
  get 'redirect' => 'home#redirect'
  get 'about' => 'home#about'
  get 'how_it_works' => 'home#how_it_works'
  root to: "home#index"
  devise_for :users, :path_prefix => 'd'
  resources :users, only: [:show, :index] do 
    resources :cycles, param: :title, only: [:show, :index] do 
      get :reset
      resources :stats
      resources :good_habits do
        resources :checkpoints
        
      end
      resources :bad_habits
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

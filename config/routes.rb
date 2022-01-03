Rails.application.routes.draw do
  get 'redirect' => 'home#redirect'
  get 'about' => 'home#about'
  get 'index' => 'home#index'
  get 'how_it_works' => 'home#how_it_works'
  root to: "home#how_it_works"
  resources :messages, only: [:new, :create]
  devise_for :users, :path_prefix => 'd'
  resources :users do 
    get :admin
    get :destroy
    resources :cycles, param: :title, only: [:show, :index] do 
      get :reset
      resources :stats
      resources :good_habits do
        resources :checkpoints
        
      end
      resources :bad_habits do
        resources :checkpoints
        
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

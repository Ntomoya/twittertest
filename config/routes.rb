Rails.application.routes.draw do
  root to: 'registrations#new'
  
  resource :registrations, only: [:new, :create]
  resource :sessions, only: [:new, :create, :destroy]
  resource :settings, only: [:edit, :update]
  
  resources :users, only: [:index, :show] do
    resource :follows, only: [:create, :destroy]
    get :follows,   on: :member
    get :favorites, on: :member
    get :followers, on: :member
  end

  resources :tweets do
    resources :favorites, only: [:create, :destroy]
    get :timeline, on: :collection
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

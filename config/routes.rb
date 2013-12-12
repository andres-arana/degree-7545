Koncu::Application.routes.draw do
  resources :tournaments, except: [:index] do |tournaments|
    member do
      post 'ready'
    end
    resources :teams, except: [:index] do
      resources :members, except: [:index]
    end
    resource :fixture, only: [:show] do
      resources :events, only: [:edit, :update]
    end
  end

  devise_paths = {
    sign_in: 'sign-in',
    sign_out: 'sign-out',
    sign_up: 'sign-up'
  }

  devise_controllers = {
    omniauth_callbacks: "omniauth"
  }

  devise_for :users, path_names: devise_paths, controllers: devise_controllers

  get 'profile', to: "dashboard#show"

  root to: 'home#show'
end

Koncu::Application.routes.draw do
  resources :tournaments

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

  root to: 'high_voltage/pages#show', id: 'home'
end

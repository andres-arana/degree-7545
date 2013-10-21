Koncu::Application.routes.draw do
  resources :tournaments

  devise_for :users, path_names: {
    sign_in: 'sign-in',
    sign_out: 'sign-out',
    sign_up: 'sign-up'
  }

  get 'profile', to: "dashboard#show"

  root to: 'high_voltage/pages#show', id: 'home'
end

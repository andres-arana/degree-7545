Koncu::Application.routes.draw do
  devise_for :users, path_names: {
    sign_in: 'sign-in',
    sign_out: 'sign-out',
    sign_up: 'sign-up'
  }

  root to: 'high_voltage/pages#show', id: 'home'
end

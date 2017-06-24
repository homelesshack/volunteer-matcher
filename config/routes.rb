Rails.application.routes.draw do
  resources :volunteers

  devise_for :accounts
  resources :charities do
    resources :needs, shallow: true
  end
  root to: 'home#index'
end

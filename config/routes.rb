Rails.application.routes.draw do
  get 'volunteer/signup', to: 'volunteer#new'

  devise_for :accounts
  resources :charities do
    resources :needs, shallow: true
  end
  root to: 'home#index'
end

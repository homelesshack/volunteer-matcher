Rails.application.routes.draw do
  devise_for :accounts
  resources :charities
  root to: "home#index"
end

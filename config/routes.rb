Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'volunteer/signup', to: 'volunteer#new'

  devise_for :accounts
  root to: "home#index"
end

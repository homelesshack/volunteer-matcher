Rails.application.routes.draw do
  devise_for :accounts
  authenticated :account do
    resources :volunteers, only: %i[new create]
    resources :charities, only: %i[new create]

    authenticate :account, ->(account) { account.accountable_type == 'Volunteer' } do
      root to: 'home#volunteer'
      resources :volunteers, only: %i[edit update destroy]
      resources :charities, only: %i[index show]
      resources :needs, only: %i[index show]
    end

    authenticate :account, ->(account) { account.accountable_type == 'Charity' } do
      root to: 'home#charity'
      resources :volunteers, only: %i[index show]
      resources :charities, only: %i[edit update destroy] do
        resources :needs, shallow: true
      end
    end
    root to: 'home#profile'
  end
  root to: 'home#index'
end

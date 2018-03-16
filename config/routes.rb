Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'targets#new'
  resources :targets, only: %i[new create index]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end

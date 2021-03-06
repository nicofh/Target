Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  authenticated :user do
    root to: 'targets#new'
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :targets, except: %i[update show]
end

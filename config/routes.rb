require 'sidekiq/web'

Rails.application.routes.draw do
  get '/p/:id', to: 'pages#show', as: :page
  root 'home#index'
  devise_for :users, controllers: { registrations: 'registrations' }

  namespace :api do
    namespace :merchants do
      resources :stats, only: :index
      resources :search, only: :index
    end
    resources :merchants, only: %i[index show] do
      resources :menu, only: :index
      resources :stats, controller: "merchants/stats", only: :index
    end
  end
  get '/builder', to: redirect('/builder/merchant/new'), as: :builder
  namespace :builder do
    resource :merchant, only: %i[new create show]
    resource :menu, only: %i[new update show]
    resource :preview, only: :show
  end
  resources :merchants do
    resources :menu_items, except: %i[index show] do
      put :sort, on: :collection
    end
    resource :cards, only: :show
    resource :code, only: :show
    resources :sections do
      put :sort, on: :collection
    end
    resources :orders, only: %i[index show create]
  end
  get '/dashboard', to: 'dashboard#show', as: :user_root
  resources :pages, only: :show
  get '/privacy', to: 'privacy#show'
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end

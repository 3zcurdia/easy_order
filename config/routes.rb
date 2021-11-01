# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  get '', to: 'pages#show', as: :merchant_page, constraints: SubdomainConstraint
  get '/p/:id', to: 'pages#show', as: :page
  get '/dashboard', to: 'dashboard#show', as: :dashboard
  root to: 'home#index'
  devise_for :users, controllers: { registrations: :registrations }

  namespace :api do
    namespace :merchants do
      resources :stats, only: :index
      resources :search, only: :index
    end
    resources :merchants, only: %i[index show] do
      resources :menu, only: :index
      resources :stats, controller: 'merchants/stats', only: :index
    end
  end

  get '/builder', to: redirect('/builder/merchant/new'), as: :builder
  namespace :builder do
    resource :merchant, only: %i[new create show]
    resource :menu, only: %i[new update show]
    resource :preview, only: :show
  end

  resources :merchants do
    resources :menu_items do
      put :sort, on: :collection
      put :toggle_availability, on: :member
    end
    resources :sections do
      put :sort, on: :collection
    end
    resource :cards, only: :show
    resource :code, only: :show
    resources :orders, only: %i[index show create]
  end

  resources :pages, only: :show
  get '/privacy', to: 'privacy#show', as: :privacy
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end

require 'sidekiq/web'

Rails.application.routes.draw do
  get '/p/:id', to: 'pages#show', as: :page
  root 'home#index'
  devise_for :users, controllers: { registrations: 'registrations' }

  namespace :api do
    resources :search_merchants, only: :index
  end
  get '/builder', to: redirect('/builder/merchant/new'), as: :builder
  namespace :builder do
    resource :merchant, only: %i[new create show]
    resource :menu, only: %i[new update show]
    resource :preview, only: :show
  end
  resources :merchants do
    resources :menu_items, except: %i[index show]
    resource :cards, only: :show
    resource :code, only: :show
  end
  get '/dashboard', to: 'dashboard#show', as: :user_root
  get '/privacy', to: 'privacy#show'
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end

Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  namespace :api do
    resources :search_merchants, only: :index
  end
  namespace :builder do
    resource :merchant, only: %i[new create show]
    resource :menu, only: %i[new update show]
    resource :preview, only: :show
  end
  resources :merchants do
    resources :menu_items, except: %i[index show]
  end
  get '/dashboard', to: 'dashboard#show', as: :user_root
  get '/:id', to: 'pages#show', as: :page
end

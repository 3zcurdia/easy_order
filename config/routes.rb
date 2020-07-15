Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  namespace :builder do
    resource :merchant, only: %i[new create show]
    resource :menu, only: %i[new update show]
    resource :preview, only: :show
  end
  resources :merchants
  get '/dashboard', to: 'dashboard#show', as: :user_root
  get '/:id', to: 'pages#show', as: :page
end

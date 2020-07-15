Rails.application.routes.draw do
  devise_for :users
  namespace :builder do
    resource :merchant, only: %i[new create show]
    resource :menu, only: %i[new update show]
    resource :preview, only: :show
  end
  resource :dashboard, only: :show
  get '/:id', to: 'pages#show', as: :page
  root 'home#index'
end

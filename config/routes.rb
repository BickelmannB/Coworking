Rails.application.routes.draw do
  get 'ajax/index', to: "ajax#index"
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/:token/confirm_email', to: "requests#confirm_email", as: 'confirm_email'
  get '/:token/reconfirm_email', to: "requests#reconfirm_email", as: 'reconfirm_email'
  get '/:token/unconfirm_email', to: "requests#unconfirm_email", as: 'unconfirm_email'
  get '/:token/contract', to: "requests#contract", as: 'contract'
  get '/:token/contract_acceptation', to: "requests#contract_acceptation", as: 'contract_acceptation'
  get '/request/accept/:token', to: "requests#accept", as: 'accept'
  get '/users/user_adress', to: "users#user_adress"
  resources :requests, only: [:index, :new, :create, :show]
  resources :workplaces
  resources :reservations
  resources :users, only: [:edit, :update, :show]
  resources :apis, only: [:index]
end

Rails.application.routes.draw do
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
  get 'workplaces/load_wp', to: "workplaces#load_wp", as: 'load'
  get 'workplaces/export_files', to: "workplaces#export_files", as: 'export'
  get 'workplaces/export_filtered_files', to: "workplaces#export_filtered_files", as: 'export_filtered'
  get 'workplaces/import', to: "workplaces#import"
  get 'reservations/pdf', to: "reservations#pdf", as: 'pdf'
  get 'reservations/test', to: "reservations#test", as: 'test'
  resources :requests, only: [:index, :new, :create, :show]
  resources :workplaces do
    collection { post :import }
  end
  resources :reservations
  resources :users, only: [:edit, :update, :show]
end

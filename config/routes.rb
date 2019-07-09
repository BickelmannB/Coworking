Rails.application.routes.draw do
  # require "sidekiq/web"
  # authenticate :user, lambda { |u| u.admin } do
  #   mount Sidekiq::Web => '/sidekiq'
  # end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/:token/confirm_email', to: "requests#confirm_email", as: 'confirm_email'
  get '/:token/reconfirm_email', to: "requests#reconfirm_email", as: 'reconfirm_email'
  get '/:token/unconfirm_email', to: "requests#unconfirm_email", as: 'unconfirm_email'
  get '/:token/contract', to: "requests#contract", as: 'contract'
  get '/:token/contract_acceptation', to: "requests#contract_acceptation", as: 'contract_acceptation'
  resources :requests, only: [:index, :new, :create, :show]

end

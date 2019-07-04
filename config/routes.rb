Rails.application.routes.draw do
  # require "sidekiq/web"
  # authenticate :user, lambda { |u| u.admin } do
  #   mount Sidekiq::Web => '/sidekiq'
  # end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/:token/confirm_email', to: "requests#confirm_email", as: 'confirm_email'
  resources :requests, only: [:index, :new, :create, :show]

end

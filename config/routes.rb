Rails.application.routes.draw do
  # require "sidekiq/web"
  # authenticate :user, lambda { |u| u.admin } do
  #   mount Sidekiq::Web => '/sidekiq'
  # end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :requests, only: [:index, :new, :create, :show]
  get '/:token/confirm_email/', to: "request#confirm_email", as: 'confirm_email'
end

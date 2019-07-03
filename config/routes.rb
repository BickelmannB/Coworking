Rails.application.routes.draw do
  get 'requests/index'
  get 'requests/new'
  get 'requests/create'
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

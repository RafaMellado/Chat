Rails.application.routes.draw do
  resources :messages
  resources :rooms
  resources :users, param: :_name
  post '/auth/login', to: 'authentication#login'
end

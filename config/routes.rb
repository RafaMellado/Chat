Rails.application.routes.draw do

  mount ActionCable.server => '/cable'
  
  resources :messages
  resources :rooms
  resources :users, param: :_name
  post '/auth/login', to: 'authentication#login'
end

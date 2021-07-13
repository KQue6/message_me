Rails.application.routes.draw do
  root 'chatroom#index'
  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  delete 'logout', to: 'sessions#destroy'
end

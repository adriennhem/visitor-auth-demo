Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  get  '/auth/encode_token', to: 'auth#encode_token'
end

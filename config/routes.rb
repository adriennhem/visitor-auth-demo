Rails.application.routes.draw do
  root 'pages#index'
  get '/auth/encode_token', to: 'auth#encode_token'
end

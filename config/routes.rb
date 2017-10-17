Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get '/thankyou', to: 'pages#thankyou'
  get '/error', to: 'pages#error'
  resources :contacts
end

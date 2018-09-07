Rails.application.routes.draw do
  root 'home#root'
  get '/weather', to: 'weather#index'
end

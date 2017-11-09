Rails.application.routes.draw do
  get 'pages/home'

  get '/count',     to: 'pages#count',   as: 'count'
  get '/status',    to: 'pages#status', as: 'status'

  root 'pages#home'
end

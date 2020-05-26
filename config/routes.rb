Rails.application.routes.draw do
  resources :users
  resources :clothes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  root 'welcome#home'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

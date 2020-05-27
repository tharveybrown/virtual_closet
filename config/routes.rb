Rails.application.routes.draw do
  resources :outfits
  resources :closets
  resources :users
  resources :clothes
  get 'clothes/new' => 'clothes#new'
  get '/closet' => 'closets#show'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/profile' => 'users#show'

  root 'welcome#home'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

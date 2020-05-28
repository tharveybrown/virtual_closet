Rails.application.routes.draw do
  resources :outfits 
  resources :closets
  resources :users do
    resources :outfits, only: :show
  end
  resources :clothes
  get '/closet' => 'closets#show'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/users/:id/outfits' => 'users#show'
  post '/outfits/look' => 'outfits#look'
  root 'welcome#home'
  # post '/outfits/create' => 'outfits#create'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users,only: [:show,:index,:edit,:update] do
  	resource :relationships, only: [:create, :destroy]
  	get :follows, on: :member
  	get :followers, on: :member
  end
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resources :post_comments, only: [:create, :destroy]
  end
  root 'home#top'
  get 'home/about'

  get '/search', to: 'searchs#search'
  get '/map_request', to: 'users#map', as: 'map_request'
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
end

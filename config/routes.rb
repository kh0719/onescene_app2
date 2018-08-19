Rails.application.routes.draw do
  root :to => "home#index"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', :registrations => 'registrations' }
  resources :users, only: [:index, :show]
  resources :microposts, only: [:show, :create, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
end

Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
=======

  devise_for :users
  resources :courses do 
    resources :lessons
  end
  resources :users, only: [:index, :edit, :show, :update]
  root 'home#index'
  get 'home/activity'
>>>>>>> core-functionality
end

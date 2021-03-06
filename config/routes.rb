Rails.application.routes.draw do

  devise_for :users
  resources :courses do 
    resources :lessons
  end
  resources :users, only: [:index, :edit, :show, :update]
  root 'home#index'
  get 'home/activity'
end

Rails.application.routes.draw do
  devise_for :users
  resources :enrolments
  resources :courses do 
    resources :lessons
    resources :enrolments, only: [:new, :create]
  end
  resources :users, only: [:index, :edit, :show, :update]
  root 'home#index'
  get 'home/activity'
end

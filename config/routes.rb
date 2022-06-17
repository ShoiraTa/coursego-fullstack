Rails.application.routes.draw do
  resources :enrolments

  devise_for :users
  resources :courses do 
    resources :lessons
  end
  resources :users, only: [:index, :edit, :show, :update]
  root 'home#index'
  get 'home/activity'
end

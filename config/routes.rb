Rails.application.routes.draw do
  devise_for :users
  # get 'times/index'
  root "goals#index"
  namespace :users do
    resources :rankings, only: [:index,:show]
  end
  resources :goals, except: [:destroy]
  resources :y_times, except: [:new,:destroy]
  resources :users, except: [:create,:destroy]
  resources :authors, only: [:new,:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

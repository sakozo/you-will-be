Rails.application.routes.draw do
  devise_for :users
  # get 'times/index'
  root "goals#index"
  namespace :users do
    resources :rankings
  end
  resources :goals
  resources :y_times
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

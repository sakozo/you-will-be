Rails.application.routes.draw do
  devise_for :users
  # get 'times/index'

  root "goals#index"
  resources :goals
  resources :y_times
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

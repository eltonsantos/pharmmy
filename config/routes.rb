Rails.application.routes.draw do
  resources :medicine_categories
  resources :categories
  resources :medicines
  get 'home/index'

  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

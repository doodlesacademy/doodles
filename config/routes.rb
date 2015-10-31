Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get 'board', to: 'home#board'

  resources :projects do
    resources :lessons, except: [:index]
  end
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get 'board', to: 'home#board'
  get 'donors', to: 'home#donors'

  resources :projects do
    resources :lessons, except: [:index]
  end
end

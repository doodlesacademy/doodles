Rails.application.routes.draw do
  resources :assets
  devise_for :users

  root to: 'home#index'
  get "about", to: "home#about"
  get 'donors', to: 'home#donors'
  get "contact", to: "home#contact"
  get "partners", to: "home#partners"
  get "volunteer", to: "home#volunteer"

  get 'board', to: 'members#index'

  resources :projects do
    resources :lessons, except: [:index]
  end

  post 'feedback', to: 'feedback_messages#create'
end

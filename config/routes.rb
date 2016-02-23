Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  get "about", to: "home#about"
  get 'donors', to: 'home#donors'
  get "contact", to: "home#contact"
  get "partners", to: "home#partners"
  get "classes", to: "home#classes"

  get 'board', to: 'members#index'

  resources :projects, param: :slug, only: [:index, :show] do
    resources :lessons, param: :slug, only: [:index, :show]
  end

  resources :assets

  post 'feedback', to: 'feedback_messages#create'
end

Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  get "about", to: "home#about"
  get 'donors', to: 'home#donors'
  get "contact", to: "home#contact"
  get "supporters", to: "home#partners"
  get "classes", to: "home#classes"
  get "donate", to: "home#donate"

  get 'team', to: 'members#index'
  get "page/:slug", to: 'home#page', as: 'pages'
  post 'feedback', to: 'feedback_messages#create'
  post 'subscribe', to: 'subscriptions#create'
  post 'update_subscription', to: 'subscriptions#update'
  get 'thanks', to: 'subscriptions#thanks'

  get 'admin', to: 'admin#index'
  namespace 'admin' do
    resources :pages, :project_sets, :projects, :lessons, :galleries, :members, :supply_items
  end

  resources :users
  resources :projects, param: :slug, only: [:index]
  scope ':academy' do
    resources :projects, param: :slug, only: [:show] do
      resources :lessons, param: :slug, only: [:index, :show]
      get "gallery", to: "project#gallery", as: 'gallery'
    end
  end

  get '*', to: 'page_controller#show'

end

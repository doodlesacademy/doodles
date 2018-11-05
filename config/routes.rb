Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  get "about", to: "home#about"
  get "supporters", to: "donors#index"
  get "classes", to: "home#classes"
  get "donate", to: "home#donate"
  get "subscribe", to: "home#subscribe"
  get "artroom", to: "users#artroom"
  get "memberships", to: "home#memberships"
  get "native-heritage-2018", to: 'home#heritage'

  get 'store', to: 'store#index'
  get 'store/checkout', to: 'store#checkout'
  get 'store/product', to: 'store#product'
  get 'store/landing', to: 'store#landing'

  get 'team', to: 'members#index'
  get "page/:slug", to: 'home#page', as: 'pages'

  post 'subscribe', to: 'subscriptions#create'
  get 'thanks', to: 'subscriptions#thanks'

  get 'contact', to: 'contact_requests#new'
  post 'contact', to: 'contact_requests#create'

  post 'feedback', to: 'feedback_messages#create'

  get 'admin', to: 'admin#index'
  namespace 'admin' do
    resources :pages, :project_sets, :projects, :lessons, :galleries, :members, :supply_items, :donors
  end

  resources :charges

  resources :users
  resource :profile, only: [:show, :update]

  resources :projects, param: :slug, only: [:index]
  scope ':academy' do
    resources :projects, param: :slug, only: [:show] do
      resources :lessons, param: :slug, only: [:index, :show]
      get "gallery", to: "project#gallery", as: 'gallery'
    end
  end

  resources :projects do
    put :favorite, on: :member
  end

  get '*', to: 'page_controller#show'

end

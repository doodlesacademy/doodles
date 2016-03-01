Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  get "about", to: "home#about"
  get 'donors', to: 'home#donors'
  get "contact", to: "home#contact"
  get "partners", to: "home#partners"
  get "classes", to: "home#classes"

  get 'board', to: 'members#index'
  get "page/:slug", to: 'home#page', as: 'pages'

  resources :projects, param: :slug, except: [:delete] do
    resources :lessons, param: :slug, only: [:index, :show]
    get "gallery", to: "project#gallery", as: 'gallery'
    get "standards", to: "standards#edit"
    match "standards", to: "standards#update", via: [:patch, :post]
  end

  resources :users

  get 'admin', to: 'admin#index'

  namespace 'admin' do
    resources :pages, :project_sets, :projects, :standards, :lessons, :galleries, :members
  end

  post 'feedback', to: 'feedback_messages#create'

end

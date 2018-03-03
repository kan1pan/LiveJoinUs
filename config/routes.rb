Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks",
  }
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :users, only:[:create, :edit, :update] do
    get :select, on: :collection
  end

  resources :events do
    post :confirm, on: :collection
    get :participation, on: :collection
    patch :participation, on: :collection
    get :searchinfo, on: :collection
    post :search, on: :collection
    get :bygenre, on: :collection
    get :showlink, on: :collection
    get :myevents, on: :collection
  end

  resources :artists do
    post :confirm, on: :collection
  end

  resources :organizers, only:[:new, :create, :update, :destroy, :show] do
    post :confirm, on: :collection
  end

  resources :conversations do
    resources :messages
  end

  resources :participants, only:[:index,:create, :destroy] do
    get :participation, on: :collection
    post :confirm, on: :collection
    patch :create, on: :collection
  end

  resources :follows, only:[:create, :destroy]

  resources :reversenominations do
    post :confirm, on: :collection
    get :searchinfo, on: :collection
    post :search, on: :collection
    get :privilege, on: :collection
  end

  resources :contacts, only:[:new, :create] do
    post :confirm, on: :collection
  end

  root "events#index"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

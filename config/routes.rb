Beta1::Application.routes.draw do
  


  get "users/index"
  resources :campaigns
  resources :locations
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :organizations
  resources :programs
  resources :program_activities
  resources :follow_users
  resources :staffs

  resources :results, only: [:index, :show]
 

  root :to => "search#index"

devise_for :users, :skip => [:sessions]
  as :user do
    get 'login' => 'devise/sessions#new', :as => :login_new
    post 'login' => 'devise/sessions#create', :as => :login
    delete 'logout' => 'devise/sessions#destroy', :as => :logout
    get 'signup' => 'devise/registrations#new', :as => :signup
    post 'signup' => 'devise/registrations#create', :as => :signup_
  end

  get 'search', to: 'search#index', as: :search
  
  get 'profile/:id', to: 'profiles#show', as: :profile_page
  get "profiles/show"
  get "search/index"
  get 'set_organization/:id', to: 'set_organization#index', as: :set_organization


  #DEVLOPMENT ROUTES
  
  #END DEVELOPMENT ROUTES


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

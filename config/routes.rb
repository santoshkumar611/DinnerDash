Rails.application.routes.draw do
  # routes for login controller
   root 'items#index'
   get 'login/login' =>'login#login',as: :login_page
   post 'login/logincheck' => 'login#logincheck' ,as: :login_logincheck
    get 'login/logout' => 'login#logout',as: :signout
   # routes for users controller 
   
   get 'users/new' => 'users#new', as: :signup
   post 'users/create' => 'users#create', as: :users
   get 'users' => 'users#index',as: :all_users
   # routes for admins controller
   
   get 'admins/new' => 'admins#new', as: :adminsignup
   post 'admins/create' => 'admins#create', as: :admins

   # routes for categories controller
    get 'categories/index' => 'categories#index',as: :allcategories
    get 'categories/new' => 'categories#new',as: :newcategory
    post 'categories/create' => 'categories#create',as: :categories
    get 'categories/destroy/:id'=> 'categories#destroy',as: :deletecategory
    get 'categories/:id' => 'categories#show' , as: :show_category
  # routes for items controller
    resources :items
    get 'items/unavailable/:id'=> 'items#unavailable',as: :unavailableitem 
      
    resources :item_orders
    get 'cart/index' => "cart#index", as: :cart
    get 'cart/clear_cart' => "cart#clear_cart"
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

MarketingWeb::Application.routes.draw do
  
  get "index", :to => "website#index", :as => "index"

  get "tour", :to => "website#tour", :as => "tour"

  get "features" , :to => "website#features", :as => "features"

  get "pricing", :to => "website#pricing", :as => "pricing"

  get "why-fleetnext", :to => "website#why_fleetnext", :as => "why_fleetnext"

  get "faq", :to => "website#faq", :as => "faq"

  get "contact", :to => "website#contact", :as => "contact"

  post "contact_process", :to => "website#contact_process", :as => "contact_process"

  get "about", :to => "website#about", :as => "about"

  get "privacy-policy", :to => "website#privacy", :as => "privacy_policy"

  get "terms-and-conditions", :to => "website#terms", :as => "terms_and_conditions"

  post "subscribe", :to => "website#subscribe", :as => "subscribe"

  root :to => 'website#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

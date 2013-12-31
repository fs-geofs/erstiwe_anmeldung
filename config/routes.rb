ErstiweAnmeldung::Application.routes.draw do
  devise_for :waitings, :controllers => {:registrations => 'waitings_registrations', :confirmations => 'waitings'}, :path => 'waiting_list'
  root :to => 'landing_page#index'
  devise_for :users, :controllers => {:registrations => 'registrations'}, :path => ''
  
  devise_scope :waiting do
    get "waiting_list/", :to => "waitings_registrations#new"
    get "waiting_list/list", :to => "waitings_registrations#list"
    get "waiting_list/closed", :to => 'landing_page#index', as: :waitings
    post "waiting_list/mass_add", :to => "waitings_registrations#mass_add"
  end

  devise_scope :user do
    get "users/list", :to => "registrations#list"
    get "edit_credentials", :to => "registrations#edit_email_password"
    get "users/:id/edit", :to => "registrations#edit", as: :edit_user
    delete "users/:id/erase", :to => "registrations#erase", as: :erase_user
  end

  get 'tickets/print'
  post 'tickets/generate' => 'tickets#generate'

  get 'app_config' => 'app_config#edit'
  patch 'app_config' => 'app_config#update'
  get 'app_config/reset_mail' => 'app_config#registration_complete_mail'
  get 'app_config/reset_mail_hard' => 'app_config#registration_complete_mail_hard_reset'
  post 'app_config/toggle_waiting_list' => 'app_config#toggle_waiting_list'


  #get "registrations/new"
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

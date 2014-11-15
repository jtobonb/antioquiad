# -*- encoding : utf-8 -*-
Antioquiad::Application.routes.draw do
  
  root :to => "start#index"
  get "admin/dashboard"

# get '/equipment/tipo', to: 'equipment#tipo'

  ActiveAdmin.routes(self)
  get '/equipment/new/:dane_sede', to: 'equipment#new'
  get '/equipment/tipo/:tipo', to: 'equipment#tipo'
  get '/equipment/programa/:origen', to: 'equipment#programa'
  get '/equipment/programa/:fecha_entrega', to: 'equipment#fecha'
  get '/equipment/fabricante/:fabricante', to: 'equipment#fabricante'
  get '/principal_establecs/informacion_usuario', to: 'principal_establecs#informacion_usuario' 
  get '/equipment/reportes', to: 'equipment#reportes'
  get '/subregions/subregions_reporte/:subregion', to: 'subregions#subregions_reporte'
  get '/municipios/municipios_reporte/:municipio', to: 'municipios#municipios_reporte'
  get '/establecimientos/establecimientos_reporte/:dane_establecimiento', to: 'principal_establecs#establecimientos_reporte'
  get '/sedes/sedes_reporte/:dane_sede', to: 'sedes#sedes_reporte'
  resources :municipios
  resources :subregions
  resources :suppliers
  resources :sedes
  resources :principal_establecs
  resources :establec_ppals
  resources :equipment
  resources :prog_entregas
  resources :usuarios
  resources :componentes
  resources :equipos
  resources :sede_establecs
  resources :establec_ppals
  resources :establecimientos
  devise_for :users

  ActiveAdmin.routes(self)

    #get "start/index"
    
   # root :to => "start#index"

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

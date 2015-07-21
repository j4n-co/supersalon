Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :product_imports, :only => [:index, :new, :create]
  		#connect 'export', to: 'product_imports#export'
	get 'product_imports/export', to: 'product_imports#export', as: :product_imports_export
  	get 'product_imports/magento_export', to: 'product_imports#magento_export', as: :product_imports_magento_export

  end
end
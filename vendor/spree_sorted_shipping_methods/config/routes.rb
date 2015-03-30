Spree::Core::Engine.routes.draw do
  
  namespace :admin do
    resources :shipping_methods do
      collection do
        post :update_positions
      end
    end
  end

end

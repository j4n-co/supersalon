Spree::Core::Engine.routes.append do
  namespace :admin do
    get 'invoice/:id(/:template)' => 'invoice#lasku'
  end
end

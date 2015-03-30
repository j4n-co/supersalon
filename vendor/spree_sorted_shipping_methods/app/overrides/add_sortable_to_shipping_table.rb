Deface::Override.new(
  :virtual_path => 'spree/admin/shipping_methods/index',
  :name => 'add_sortable_to_shipping_table',
  :set_attributes => "#listing_shipping_methods",
  :attributes => {:class => 'sortable', :'data-sortable-link' => "/admin/shipping_methods/update_positions"}, 
  :disabled => false)

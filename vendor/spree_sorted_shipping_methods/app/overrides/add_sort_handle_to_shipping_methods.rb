Deface::Override.new(
  :virtual_path => 'spree/admin/shipping_methods/index',
  :name => 'sortable_shipping_methods',
  :insert_top => "[data-hook='admin_shipping_methods_index_rows']",
  :partial => 'spree/admin/shipping_methods/sort_shipping_methods', 
  :disabled => false)

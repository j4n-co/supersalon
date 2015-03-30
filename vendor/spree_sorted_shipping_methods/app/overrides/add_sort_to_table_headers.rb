Deface::Override.new(
  :virtual_path => 'spree/admin/shipping_methods/index',
  :name => 'add_sort_to_table_headers',
  :insert_top => "[data-hook='admin_shipping_methods_index_headers']",
  :text => '<th class="no-border"></th>', 
  :disabled => false)

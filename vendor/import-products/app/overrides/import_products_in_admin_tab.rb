Deface::Override.new(:virtual_path => "spree/admin/shared/_menu",
                     :name => "import_products_admin_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :text => "<%= tab(:product_imports, :icon => 'icon-file') %>",
                     :disabled => false)
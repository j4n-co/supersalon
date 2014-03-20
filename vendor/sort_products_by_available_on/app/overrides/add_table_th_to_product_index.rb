Deface::Override.new(:name => "add_table_th_to_product_index",
					 :virtual_path => "spree/admin/products/index",
                     :insert_before => "[data-hook='admin_products_index_header_actions']",
                     :partial => "spree/admin/products/product_header",
                     :disabled => false)
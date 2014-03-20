Deface::Override.new(:name => "add_table_td_to_product_index",
					 :virtual_path => "spree/admin/products/index",
                     :replace => "[data-hook='admin_products_index_rows']",
                     :partial => "spree/admin/products/product_row",
                     :disabled => false)
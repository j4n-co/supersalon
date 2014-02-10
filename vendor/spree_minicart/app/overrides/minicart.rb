Deface::Override.new(:virtual_path => 'spree/shared/_top_nav',
                    :name => 'add_mini_cart',
                    :insert_bottom => "#top_nav_content",
                    :partial => "spree/shared/minicart")

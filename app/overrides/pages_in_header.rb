Deface::Override.new(:virtual_path => "spree/shared/_header",
                     :name => "pages_in_header",
                     :insert_bottom => "#links-in-header",
                     :partial => "spree/static_content/static_content_header",
                     :disabled => false)
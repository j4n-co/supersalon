Spree::Product.class_eval do
    default_scope order("spree_products.available_on DESC")
 end
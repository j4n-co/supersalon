Spree::Product.class_eval do
	attr_accessible :translations_attributes
	default_scope order("spree_products.created_at DESC")
end
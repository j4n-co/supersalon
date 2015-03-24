Spree::Taxon.class_eval do

	after_create :clear_taxon_cache
	after_update :clear_taxon_cache
	after_destroy :clear_taxon_cache


	def clear_taxon_cache
		ActionController::Base.new.expire_fragment("taxonomies_cache")
	end

end
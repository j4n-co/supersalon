Spree::Stock::Estimator.class_eval do  
	
	def choose_default_shipping_rate(shipping_rates)
	  unless shipping_rates.empty?
		shipping_rates.sort_by{ |r| r.shipping_method.position.to_i }.first.selected = true
	  end
	end

	def sort_shipping_rates(shipping_rates)
	   shipping_rates.sort_by!{ |r| r.shipping_method.position.to_i }
	end

end

Spree::Stock::Estimator.class_eval do  
	def choose_default_shipping_rate(shipping_rates)
	  unless shipping_rates.empty?
		shipping_rates.max_by(&:cost).selected = true
	  end
	end
end

Spree::ShippingRate.class_eval do 

  def name_with_price
    "#{name} - #{display_cost}"
  end

end

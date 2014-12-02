Spree::Product.class_eval do
    default_scope order("spree_products.available_on DESC")

    def check_valid_permalink 

   		if self.permalink.present? 
    		self.permalink = self.permalink.gsub(/[^0-9a-z,\-\ ]/i, '').squish.gsub(/ /i,'-').to_s.to_url
   		else 
   			self.permalink = name.to_s.to_url
   		end 
    end

    before_update :check_valid_permalink

end
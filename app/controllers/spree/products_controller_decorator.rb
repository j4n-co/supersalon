Spree::ProductsController.class_eval do
    before_filter :load_product, :only => :show
    rescue_from ActiveRecord::RecordNotFound, :with => :render_404
    helper 'spree/taxons'

    respond_to :html

    def show
      return unless @product

      @variants = @product.variants_including_master.active(current_currency).includes([:option_values, :images])
      @product_properties = @product.product_properties.includes(:property)
      
      number_of_taxons = @product.taxons.length
      
      @related_products = []

      @product.taxons.each do |taxon|
        taxon.products.each do |product|
          if product != @product && !product.deleted?
            @related_products << product 
          end
        end
      end

      @related_products = @related_products.uniq.sample(3)

      referer = request.env['HTTP_REFERER']
      if referer
        begin
          referer_path = URI.parse(request.env['HTTP_REFERER']).path
          # Fix for #2249
        rescue URI::InvalidURIError
          # Do nothing
        else
          if referer_path && referer_path.match(/\/t\/(.*)/)
            @taxon = Spree::Taxon.find_by_permalink($1)
          end
        end
      end
    end

end

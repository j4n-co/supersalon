
Spree::TaxonsController.class_eval do 

    rescue_from ActiveRecord::RecordNotFound, :with => :render_404
    helper 'spree/products'

    respond_to :html

    def show
      @taxon = Spree::Taxon.find_by_permalink!(params[:id])
      return unless @taxon

      #@searcher = Spree::Config.searcher_class.new(params.merge(:taxon => @taxon.id))
      
      @searcher = build_searcher(:order_by=>'available_on', :page => params[:page], :taxon => @taxon.id, :current_currency => current_currency )

      @searcher.current_user = try_spree_current_user
      @searcher.current_currency = current_currency
      @products = @searcher.retrieve_products
    
      if @taxon.parent_id.nil? 
        respond_with(@taxon, :template => 'spree/taxons/taxon_overview')
      else 
        respond_with(@taxon)
      end  

    end


end
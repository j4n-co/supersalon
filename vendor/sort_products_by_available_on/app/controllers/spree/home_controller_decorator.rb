Spree::HomeController.class_eval do
    helper 'spree/products'
    respond_to :html

    def index
      @searcher = build_searcher(:order_by=>'available_on', :page => params[:page], :current_currency => current_currency )
      @searcher.current_currency = current_currency
      @products = @searcher.retrieve_products
    end
end

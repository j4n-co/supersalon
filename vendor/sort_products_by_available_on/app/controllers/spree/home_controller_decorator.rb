Spree::HomeController.class_eval do
    helper 'spree/products'
    respond_to :html

    def index
      @searcher = build_searcher(params)
      @products = @searcher.retrieve_products.order(available_on: :desc,created_at: :desc )
    end
end

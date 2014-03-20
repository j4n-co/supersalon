Spree::Admin::ProductsController.class_eval do 

  helper 'spree/products'

  before_filter :load_data, :except => :index
  create.before :create_before
  update.before :update_before
  helper_method :clone_object_url


  protected

    def collection
      return @collection if @collection.present?
      params[:q] ||= {}
      params[:q][:deleted_at_null] ||= "1"

      params[:q][:s] ||= "available_on desc"
      @collection = super
      @collection = @collection.with_deleted if params[:q].delete(:deleted_at_null).blank?
      # @search needs to be defined as this is passed to search_form_for
      @search = @collection.ransack(params[:q])
      @collection = @search.result.
            distinct_by_product_ids(params[:q][:s]).
            includes(product_includes).
            page(params[:page]).
            per(Spree::Config[:admin_products_per_page])

      @collection
    end

end

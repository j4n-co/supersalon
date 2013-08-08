module Spree
  module Api
    Spree::Api::BaseController::TaxonsController.class_eval do

      def create
        #authorize! :create, Taxon
        @taxon = Taxon.new(params[:taxon])
        @taxon.taxonomy_id = params[:taxonomy_id]
        taxonomy = Taxonomy.find_by_id(params[:taxonomy_id])

        if taxonomy.nil?
          @taxon.errors[:taxonomy_id] = I18n.t(:invalid_taxonomy_id, :scope => 'spree.api')
          invalid_resource!(@taxon) and return
        end

        @taxon.parent_id = taxonomy.root.id unless params[:taxon][:parent_id]

        if @taxon.save
          respond_with(@taxon, :status => 201, :default_template => :show)
        else
          invalid_resource!(@taxon)
        end
      end

      def update
        #authorize! :update, Taxon
        if taxon.update_attributes(params[:taxon])
          respond_with(taxon, :status => 200, :default_template => :show)
        else
          invalid_resource!(taxon)
        end
      end

      def destroy
        #authorize! :delete, Taxon
        taxon.destroy
        respond_with(taxon, :status => 204)
      end

    end
  end 
end

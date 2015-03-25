module Spree
  Product.class_eval do

    #SOLR
    searchable :if => :indexable? do
      text :safe_name, :boost => 5.0, :more_like_this => true
      text :properties_text, :boost => 3.0, :more_like_this => true
      text :safe_description, :boost => 1.0, :more_like_this => true
      text :taxon_names_text do
        taxon_names.join(',')
      end
      time :available_on
      time :updated_at
      double :price
      string :safe_name
      string :taxon_names, :multiple => true
      integer :taxons_ids, :multiple => true
      integer :id

      Spree::Config.supported_currencies.split(',').each do |currency|  
        double :"price_in_#{currency}" do
          price_in(currency).amount
        end
      end
    
    end

    Facets = %w(
        taxon_names
        price
      )

    def indexable?
      available?
    end

    def taxons_ids
      taxons.map(&:self_and_ancestors).flatten.uniq.map(&:id)
    end

    def taxon_names
      taxons.map(&:self_and_ancestors).flatten.uniq.map(&:name)
    end

    def properties_text
      product_properties.map { |pp| "#{pp.property.name}||#{pp.value}" } if product_properties.present?
    end

    def safe_description
      self.description.strip_control_and_extended_characters if self.description.present?
    end

    def safe_name
      self.name.strip_control_and_extended_characters if self.name.present?
    end
  end
end
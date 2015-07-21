class Spree::Admin::ProductImportsController < Spree::Admin::ResourceController
  def index
    redirect_to :action => :new
  end

  def new
    @product_import = Spree::ProductImport.new
  end
  
  def magento_export 
  
    @p = Spree::Product.all.active.limit(10)
    @products = []
    

    @p.each do |p|
      h = Hash.new
      
      #Magento Import Properties
      h[:sku] = p.try(:sku) ? p.sku.to_s : "SS"+p.id;  
      h[:name] = p.try(:name) ? p.name : ' '; 
      h[:description] = p.try(:description) ? p.description : ' ';
      h[:cost] = p.try(:cost_price) ? p.cost_price.to_f : ' '; 
      h[:price] = p.try(:price) ? p.price.to_f : ' '; 
      h[:tax_category_id] = p.try(:tax_category) ? p.tax_category.name : ' ' ; 
      h[:shipping_category_id] = p.try(:shipping_category) ? p.shipping_category.name : ' ' ; 
      h[:news_from_date] = p.try(:available_on) ? p.available_on : ' ' ;
      h[:created_at] = p.try(:created_at) ? p.created_at : ' ' ;

      taxons = p.try(:taxons)? p.taxons : ' ';  #array
      
      taxon_array = []

      taxons.each do |taxon|
        parent = taxon.try(:parent)
        gparent = parent.try(:parent)
        taxon_array << [gparent.try(:name), parent.try(:name), taxon.try(:name) ].compact.join(' > ')
      end
      
      h[:taxons] = taxon_array.join(' , ')

      properties = p.try(:properties)? p.properties : ' '; 
      
      property_array = []

      properties.each do |prop|
        prop_value = Spree::ProductProperty.where(:property_id => prop.id, :product_id => p.id ).first.value
        property_array << [prop.name, prop_value]
      end   
      h[:properties] = property_array.map{|prop| prop.join(':') }.join(' , ')

      first_variant = Spree::Variant.where(:product_id => p.id).first
      stock_item = Spree::StockItem.where(:variant_id => first_variant.id).first
      h[:count_on_hand] = stock_item.count_on_hand
      h[:backorderable] = stock_item.backorderable
      @products << h
    end

    @CSV = CSV.generate do |csv|
      column_names =  @products.first.keys
      csv << column_names
      @products.each do |product|
        csv << product.values_at(*column_names)
      end
    end

    respond_to do |format|
      format.csv {send_data @CSV}
    end  

  end

  def export
    @p = Spree::Product.all
    @products = []
    
    @p.each do |p|
      h = Hash.new
      
      #Magento Import Properties
      h[:sku] = p.try(:sku) ? p.sku.to_s : "SS"+p.id;  
      h[:name] = p.try(:name) ? p.name : ' '; 
      h[:description] = p.try(:description) ? p.description : ' ';
      h[:cost_price] = p.try(:cost_price) ? p.cost_price.to_f : ' '; 
      h[:price] = p.try(:price) ? p.price.to_f : ' '; 
      h[:tax_category_name] = p.try(:tax_category) ? p.tax_category.name : ' ' ; 
      h[:shipping_category_name] = p.try(:shipping_category) ? p.shipping_category.name : ' ' ; 
      h[:available_on] = p.try(:available_on) ? p.available_on : ' ' ;
      
      taxons = p.try(:taxons)? p.taxons : ' ';  #array
      
      taxon_array = []

      taxons.each do |taxon|
        parent = taxon.try(:parent)
        gparent = parent.try(:parent)
        taxon_array << [gparent.try(:name), parent.try(:name), taxon.try(:name) ].compact.join(' > ')
      end
      
      h[:taxons] = taxon_array.join(' , ')

      properties = p.try(:properties)? p.properties : ' '; 
      
      property_array = []

      properties.each do |prop|
        prop_value = Spree::ProductProperty.where(:property_id => prop.id, :product_id => p.id ).first.value
        property_array << [prop.name, prop_value]
      end   
      h[:properties] = property_array.map{|prop| prop.join(':') }.join(' , ')

      first_variant = Spree::Variant.where(:product_id => p.id).first
      stock_item = Spree::StockItem.where(:variant_id => first_variant.id).first
      h[:count_on_hand] = stock_item.count_on_hand
      h[:backorderable] = stock_item.backorderable
      @products << h
    end

    @CSV = CSV.generate do |csv|
      column_names =  @products.first.keys
      csv << column_names
      @products.each do |product|
        csv << product.values_at(*column_names)
      end
    end

    respond_to do |format|
      format.csv {send_data @CSV}
    end
  end

  def create
    @product_import = Spree::ProductImport.create(file_params)
    #debugging without delayed jobs
    #Delayed::Job.enqueue ImportProducts::ImportJob.create(@product_import, spree_current_user)
    @import_data = Spree::ProductImport.new(file_params)
    
    @import_data.import_data!

    flash[:notice] = t('product_import_processing')
    redirect_to admin_product_imports_path
  end
  
  private

  def file_params
    params.require(:product_import).permit(:data_file )
  end

end

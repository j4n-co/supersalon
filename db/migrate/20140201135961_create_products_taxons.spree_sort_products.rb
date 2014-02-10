# This migration comes from spree_sort_products (originally 20130417071146)
class CreateProductsTaxons < ActiveRecord::Migration
  def change
    #add_column :spree_products_taxons, :id, :primary_key
    add_column :spree_products_taxons, :position, :integer, :default => 0
  end
end

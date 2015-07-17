# This migration comes from spree_sorted_shipping_methods (originally 20150330182517)
class AddSortedOrderToSpreeShippingMethods < ActiveRecord::Migration
  def change
    unless column_exists? :spree_shipping_methods, :position
    	add_column :spree_shipping_methods, :position, :integer
    end
  end
end

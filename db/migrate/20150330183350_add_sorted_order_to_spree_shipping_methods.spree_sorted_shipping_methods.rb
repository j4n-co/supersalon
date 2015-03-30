# This migration comes from spree_sorted_shipping_methods (originally 20150330182517)
class AddSortedOrderToSpreeShippingMethods < ActiveRecord::Migration
  def change
    add_column :spree_shipping_methods, :sorted_order, :integer
  end
end

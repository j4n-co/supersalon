class AddSortedOrderToSpreeShippingMethods < ActiveRecord::Migration
  def change
    add_column :spree_shipping_methods, :position, :integer
  end
end

# This migration comes from spree_sortable_prototype_properties (originally 20131007191832)
class AddPositionToPrototypeProperties < ActiveRecord::Migration
  def change
    add_column :spree_properties_prototypes, :position, :integer, default: 0
  end
end

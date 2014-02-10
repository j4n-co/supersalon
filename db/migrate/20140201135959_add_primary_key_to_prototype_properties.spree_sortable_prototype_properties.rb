# This migration comes from spree_sortable_prototype_properties (originally 20131007191745)
class AddPrimaryKeyToPrototypeProperties < ActiveRecord::Migration
  def change
    add_column :spree_properties_prototypes, :id, :primary_key
  end
end

# This migration comes from spree_promotion_zones_rule (originally 20140401102316)
class CreateSpreeZonesPromotionRules < ActiveRecord::Migration
  def change
    create_table :spree_zones_promotion_rules do |t|
      t.references :zone, index: true
      t.references :promotion_rule, index: true
    end

  end
end

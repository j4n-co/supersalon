class CreateSpreePages < ActiveRecord::Migration
  def self.up
    change_table :spree_pages do |t|
      t.string     :title
      t.string     :nav_title
      t.string     :path
      
      t.string     :meta_title
      t.string     :meta_description
      t.string     :meta_keywords
      
      t.integer    :position,   :default => 999
      t.boolean    :accessible, :default => true
      t.boolean    :visible,    :default => true
      
      t.timestamps
    end
    
  end

  def self.down
    drop_table :spree_pages
  end
end
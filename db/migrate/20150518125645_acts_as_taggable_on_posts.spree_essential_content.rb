# This migration comes from spree_essential_content (originally 20120306185750)
class ActsAsTaggableOnPosts < ActiveRecord::Migration
  def self.up
    return if table_exists? :tags

    create_table :tags do |t|
      t.string :name
    end

    create_table :taggings do |t|
      t.references :tag

      # You should make sure that the column created is
      # long enough to store the required class names.
      t.references :taggable, :polymorphic => true
      t.references :tagger, :polymorphic => true

      # Limit is created to prevent MySQL error on index
      # length for MyISAM table type: http://bit.ly/vgW2Ql
      t.string :context, :limit => 128

      t.datetime :created_at
    end

    add_index :taggings, :tag_id
    add_index :taggings, [:taggable_id, :taggable_type, :context]
  end

  def self.down
    return unless table_exists? :tags
    drop_table :tags
    drop_table :taggings
  end

end

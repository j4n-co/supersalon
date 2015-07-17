# This migration comes from spree_essential_content (originally 20120306185800)
class AddSpreeNamespaceToBlog < ActiveRecord::Migration
  def up
    unless table_exists? :spree_posts
      rename_table :posts, :spree_posts
      rename_table :post_categories, :spree_post_categories
      rename_table :post_categories_posts, :spree_post_categories_posts
      rename_table :post_products, :spree_post_products
    end
  end

  def down
    rename_table :spree_posts, :posts
    rename_table :spree_post_categories, :post_categories
    rename_table :spree_post_categories_posts, :post_categories_posts
    rename_table :spree_post_products, :post_products
  end
end
# This migration comes from spree_essential_content (originally 20120308121110)
class AddBlogIdToSpreePosts < ActiveRecord::Migration
  def self.up
  	unless column_exists? :spree_posts, :blog_id
    	add_column :spree_posts, :blog_id, :integer
  	end
  end

  def self.down
    remove_column :spree_posts, :blog_id
  end
end

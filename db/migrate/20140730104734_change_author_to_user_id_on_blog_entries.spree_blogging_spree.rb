# This migration comes from spree_blogging_spree (originally 20130704034730)
class ChangeAuthorToUserIdOnBlogEntries < ActiveRecord::Migration
  def up
    Spree::Role.create!(:name => "blogger") unless Spree::Role.where(:name => "blogger").any?
    if column_exists?(:spree_blog_entries, :author)
      remove_column :spree_blog_entries, :author
    end
    unless column_exists?(:spree_blog_entries, :author_id)
      add_column :spree_blog_entries, :author_id, :integer
    end

    unless index_exists?(:spree_blog_entries, :author_id)
      add_index :spree_blog_entries, :author_id
    end
  end
  def down
    add_column :spree_blog_entries, :author, :string
    remove_column :spree_blog_entries, :author_id
    Spree::Role.where(:name => "blogger").destroy_all 
  end
end

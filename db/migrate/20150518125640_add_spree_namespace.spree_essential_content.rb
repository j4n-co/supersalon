# This migration comes from spree_essential_content (originally 20120306185648)
class AddSpreeNamespace < ActiveRecord::Migration
  def up
    unless table_exists? :spree_contents
    	rename_table :contents, :spree_contents
	end
    #rename_table :pages, :spree_pages
  end

  def down
    rename_table :spree_contents, :contents
    rename_table :spree_pages, :pages
  end
end

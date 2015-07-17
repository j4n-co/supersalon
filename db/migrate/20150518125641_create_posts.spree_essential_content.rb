# This migration comes from spree_essential_content (originally 20120306185700)
class CreatePosts < ActiveRecord::Migration
  def self.up
    unless table_exists? :spree_posts
      create_table :posts do |t|
        t.string     :title,     :required => true
        t.string     :path,      :required => true
        t.string     :teaser
        t.datetime   :posted_at
        t.text       :body
        t.string     :author
        t.boolean    :live,      :default  => true
        t.timestamps
      end
    end
  end

  def self.down
    drop_table :posts
  end
end
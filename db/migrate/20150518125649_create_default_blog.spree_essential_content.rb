# This migration comes from spree_essential_content (originally 20120308121120)
class CreateDefaultBlog < ActiveRecord::Migration
  def self.up

   # unless Spree::Blog.find_all().blank? 

    #	@blog = Spree::Blog.create(name: "Blog", permalink: "blog")
    #	Spree::Post.update_all(blog_id: @blog.id)
  	#end 

  end

  def self.down
  end
end

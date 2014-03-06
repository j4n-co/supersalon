Spree::Image.class_eval do
  attachment_definitions[:attachment][:styles] = {
    :mini => '48x48>', # thumbs under image
    :small => '150x200>', # images on category view
    :product => '240x240>', # full product image
    :large => '600x600>'  # light box image
  }
end

# after you redeploy, 
# convert all images to jpegs
# :mini => ['48x48>',:jpg]
# and run Spree::Image.all.each {|image| image.attachment.reprocess! && image.save} 
# from the console. 
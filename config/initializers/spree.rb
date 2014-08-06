# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to override the default site name.
  # config.site_name = "Spree Demo Site"
  config.use_s3 = true
  config.s3_bucket = 'supersalon_file_storage'
  config.s3_access_key = "1XRBG1CYPYJ0Z1TVAP02"
  config.s3_secret = "2zPokmdPsQjTR19i/YbSzA0B/dPyEr2vDyOLdLlw"
  config.attachment_path = "/app/public/spree/products/:id/:style/:basename.:extension"
  config.address_requires_state = true
  config.set(:allow_ssl_in_production => false)
  config.set(:allow_ssl_in_development_and_test => false)
  config.admin_products_per_page = 100
  config.products_per_page = 24
end

Paperclip.interpolates(:s3_eu_url) do |attachment, style|
  "#{attachment.s3_protocol}://#{Spree::Config[:s3_host_alias]}/#{attachment.bucket_name}/#{attachment.path(style).gsub(%r{^/}, "")}"
end

Spree.user_class = "Spree::User"

SpreeI18n::Config.available_locales = [:pl, :en] # displayed on translation forms
SpreeI18n::Config.supported_locales = [:pl, :en] # displayed on frontend select box
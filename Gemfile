source 'https://rubygems.org'

ruby '2.2.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

gem 'rack-timeout'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'
gem 'mysql2'
gem 'redis'
gem 'redis-rails'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
group :development do
	gem 'pry'
	
	gem 'capistrano', '~> 3.3.0'
	gem 'capistrano-rails', '~> 1.1', require: false
	gem 'capistrano-bundler', '~> 1.1'
	gem 'capistrano-rvm'
	gem 'capistrano-passenger'

	gem 'rvm-capistrano', require: false
	gem 'net-ssh', '2.7.0'
	gem 'guard-rails', group: :development
	gem 'guard-livereload', group: :development
	gem 'rack-livereload', group: :development
	gem 'guard-bundler', group: :development
end

# Use debugger
# gem 'debugger', group: [:development, :test]
gem 'daemons'
gem 'delayed_job_active_record'

gem 'airbrake'

gem 'spree', '2.1.4'
gem 'spree_gateway', :git => 'https://github.com/spree/spree_gateway.git', :branch => '2-1-stable'
gem 'spree_auth_devise', path: 'vendor/spree_auth_devise-2-1-stable' #changing views 

#custom gems
gem 'spree_static_content', 	github: 'spree/spree_static_content', 		:branch => '2-1-stable' #installed
gem 'spree_related_products', 	github: 'spree/spree_related_products', 	:branch => '2-1-stable' #installed
gem 'spree_paypal_express', 	github: "radar/better_spree_paypal_express",:branch => "2-1-stable" #installed
gem 'spree_i18n', 				github: 'spree/spree_i18n', 				:branch => "2-1-stable" #installed
gem 'spree_social', 			github: 'spree/spree_social', 				:branch => "2-1-stable" #installed
gem 'spree_print_invoice' , 	github: 'spree/spree_print_invoice', 		:branch => '2-1-stable' #installed
gem 'spree_blogging_spree', 	github: 'stefansenk/spree-blogging-spree', 	:branch => "2-1-stable" #installed
gem 'spree_editor', 			github: 'spree/spree_editor', 				:branch => '2-1-stable' #installed
gem 'tinymce-rails-langs'


gem "jquery-fileupload-rails"
gem 'premailer-rails' #used with spree_simple_html_emails gems

#gem 'spree_image_multi_upload', path: 'vendor/spree_image_multi_upload' #installed in vendor - needs heavy modification
#gem 'spree_multi_currency', 				path: 'vendor/spree_multi_currency' #installed in vendor - modified routes for rails 4
gem 'spree_multi_currency', 				github: 'joshblour/spree_multi_currency', :branch => '2-1-stable' #installed in vendor - modified routes for rails 4

gem 'spree_sortable_prototype_properties',	path: 'vendor/spree_sortable_prototype_properties' #installed in vendor - no mods needed
gem 'spree_bank_transfer',					path: 'vendor/spree_bank_transfer' #installed, modified spree from 2.0.5 to 2.1.4
gem 'spree_ajax_add_to_cart',  				path: 'vendor/spree_ajax_add_to_cart' 	#installed in vendor - need bump in spree from 2.0.0 to 2.1.4, 
																		#changed deface overide from code[erb-loud] to erb[loud]
gem 'jquery-dragsort-rails', '~> 1.0.0' # required for spree_sort_products gem
gem 'spree_sort_products', 					path: 'vendor/spree_sort_products' #changed gem dependancy from spree 2.0.0 to spree 2.1.4

#for default location
gem 'geocoder'
gem 'spree_advanced_cart', 					path: 'vendor/spree_advanced_cart' 
gem 'spree_minicart', 						path: 'vendor/spree_minicart'
gem 'import_products', 						path: 'vendor/import-products' #major modifications

gem 'sort_products_by_available_on',		path: 'vendor/sort_products_by_available_on'

gem 'spree_simple_html_emails', 			path: 'vendor/spree_simple_html_emails' #typo in generator

gem 'spree_promotion_zones_rule', 			path: 'vendor/spree_promotion_zones_rule' #typo in generator

gem 'sunspot_rails'
gem 'sunspot_solr'
gem 'spree_solr', path:'vendor/spree_solr'

#payu integration
gem 'openpayu'
#gem 'spree_open_payu', 						path: 'spree_open_payu'
#gem 'faraday'
#gem 'faraday_middleware'
#gem 'spree_pay_u', path: 'vendor/spree_pay_u'

#gem "payu_rails", git: "https://github.com/pibako/payu_rails"

source 'https://rubygems.org'

ruby "1.9.3"

gem 'rails', '3.2.13'


gem 'yaml_db'
gem 'jquery-rails'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

#this breaks heroku and BUNDLE_WITHOUT isn't working at all. 
gem 'sqlite3'
gem 'mysql2'

group :development do
	gem 'debugger'
	gem 'pry'
	gem 'guard-livereload'
	gem 'rack-livereload'
	gem 'pry-debugger'
	gem 'heroku_san'
end

#heroku specific
group :staging do
	gem 'thin'
	gem 'pg'
	#gem 'heroku_rails_deflate'
end

#digitalOcean specific
group :production do
end

#digitalOcean deployment
gem 'capistrano'
gem 'rvm-capistrano'

gem 'airbrake'

#SPREE 2.0.3
gem 'spree', '2.0.3'


gem 'datashift'
gem 'datashift_spree'


gem 'spree_gateway', :github => 'spree/spree_gateway', :branch => '2-0-stable'
gem "spree_auth_devise", :github => "spree/spree_auth_devise", :branch => '2-0-stable'

#custom gems 
gem 'spree_static_content', :github => 'spree/spree_static_content', :branch => '2-0-stable'
gem 'spree_multi_currency', :github => "spree/spree_multi_currency", :branch => 'master'
gem 'spree_related_products', :github => 'spree/spree_related_products', :branch => 'master'
gem 'spree_bank_transfer',  :github => 'vinsol/spree_bank_transfer', :branch => 'master'
gem 'spree_paypal_express', :github => "radar/better_spree_paypal_express", :branch => "2-0-stable"

gem "jquery-fileupload-rails"

gem 'spree_print_invoice' , :github => 'spree/spree_print_invoice', :branch => 'master'

gem 'spree_html_invoice', :path => 'vendor/engines/spree_html_invoice'

gem 'spree_i18n', :path => 'vendor/engines/spree_i18n-master'

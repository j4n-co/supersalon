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

gem 'sqlite3'
gem "mysql2"

group :development do
	gem 'debugger'
	gem 'pry'
	gem 'guard-livereload'
	gem 'rack-livereload'
	gem 'pry-debugger'
	gem 'datashift', :git => 'http://github.com/autotelik/datashift'
	gem 'datashift_spree', :git => 'http://github.com/autotelik/datashift_spree'
end

group :production do
	gem 'thin'
	gem 'pg'
	#gem 'heroku_rails_deflate'
end

#digitalOcean deployment
gem 'capistrano'
gem 'rvm-capistrano'

#SPREE 2.0.3
gem 'spree', '2.0.3'

gem 'spree_gateway', github: 'spree/spree_gateway', :branch => '2-0-stable'
gem "spree_auth_devise", :github => "spree/spree_auth_devise", :branch => '2-0-stable'

#custom gems 
gem 'spree_static_content', :github => 'spree/spree_static_content', :branch => '2-0-stable'
gem 'spree_multi_currency', :github => "spree/spree_multi_currency", :branch => 'master'
gem 'spree_related_products', :github => 'spree/spree_related_products', :branch => 'master'
gem 'spree_bank_transfer',  :github => 'vinsol/spree_bank_transfer', :branch => 'master'
gem 'spree_paypal_express', :github => "radar/better_spree_paypal_express", :branch => "2-0-stable"

gem "jquery-fileupload-rails"

#gem 'spree_paypal_express', :github => "radar/better_spree_paypal_express", :branch => "2-0-stable"


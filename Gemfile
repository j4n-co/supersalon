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


group :development do
	gem 'sqlite3'
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
end

gem 'spree', '2.0.3'
gem 'spree_gateway', :git => 'https://github.com/spree/spree_gateway.git', :branch => '2-0-stable'
gem 'spree_auth_devise', :git => 'https://github.com/spree/spree_auth_devise.git', :branch => '2-0-stable'

#custom gems 
gem 'spree_static_content', :github => 'spree/spree_static_content', :branch => '2-0-stable'
gem 'spree_multi_currency', :github => "spree/spree_multi_currency", :branch => 'master'
gem 'spree_related_products', :github => 'spree/spree_related_products', :branch => 'master'
#gem 'spree_paypal_express', :github => "radar/better_spree_paypal_express", :branch => "2-0-stable"


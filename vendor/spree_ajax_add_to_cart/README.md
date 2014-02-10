# Welcome to Spree Ajax Add To Cart

This extension ajxifies 'Add to Cart' button on product page. So, when a user click on 'Add to Cart' button, their "Cart" status will be updated from an ajax response.

[![Dependency Status](https://gemnasium.com/suryart/spree_ajax_add_to_cart.png)](https://gemnasium.com/suryart/spree_ajax_add_to_cart) 
[![Build Status](https://travis-ci.org/suryart/spree_ajax_add_to_cart.png?branch=master)](https://travis-ci.org/suryart/spree_ajax_add_to_cart) 
[![Code Climate](https://codeclimate.com/github/suryart/spree_ajax_add_to_cart.png)](https://codeclimate.com/github/suryart/spree_ajax_add_to_cart)


## INSTALLATION

### In a rails application with Spree installed include the following line in your Gemfile:
  * Get the latest greatest from github: 
    
      ```ruby
        gem 'spree_ajax_add_to_cart' , :git => 'git://github.com/suryart/spree_ajax_add_to_cart.git'
      ```

  * Get the 1-3-stable branch for Spree 2.0.x from github: 
    
      ```ruby
        gem 'spree_ajax_add_to_cart' , :git => 'git://github.com/suryart/spree_ajax_add_to_cart.git', :branch => '2-0-stable'
      ```

  * Or get it from rubygems.org by mentioning the following line in your Gemfile:
    
      ```ruby 
        gem 'spree_ajax_add_to_cart', '2.0.0'
      ```

### Then run the following commands: 

    $ bundle install
    $ rails g spree_ajax_add_to_cart:install 
    $ rake db:migrate
    $ rails s 

## Testing

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test_app
    $ bundle exec rspec spec

## Contributing

1. [Fork](https://help.github.com/articles/fork-a-repo) the project
2. Make one or more well commented and clean commits to the repository. You can make a new branch here if you are modifying more than one part or feature.
3. Add tests for it. This is important so I don’t break it in a future version unintentionally.
4. Perform a [pull request](https://help.github.com/articles/using-pull-requests) in github's web interface.

## NOTE

The current version supports Spree 2.0.0 or above. Older versions of Spree are unlikely to work, so attempt at your own risk.

This extension just an updated version and heavily based on [Trung Lê](https://github.com/joneslee85/spree_ajax_add_to_cart)'s work.

Copyright (c) 2013 Surya Tripathi, released under the New BSD License

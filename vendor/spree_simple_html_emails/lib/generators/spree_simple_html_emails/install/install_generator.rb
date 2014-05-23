module SpreeSimpleHtmlEmails
  module Generators
    class InstallGenerator < Rails::Generators::Base

      # class_option :auto_run_migrations, :type => :boolean, :default => false

      def add_javascripts
        # append_file 'app/assets/javascripts/store/all.js', "//= require store/spree_simple_html_emails\n"
        # append_file 'app/assets/javascripts/admin/all.js', "//= require admin/spree_simple_html_emails\n"
      end

      def add_stylesheets
        copy_file 'stylesheets/spree_simple_html_emails.css.scss',
                  'app/assets/stylesheets/store/spree_simple_html_emails.css.scss'
        # inject_into_file 'app/assets/stylesheets/store/all.css', " *= require store/spree_simple_html_emails\n", :before => /\*\//, :verbose => true
        # inject_into_file 'app/assets/stylesheets/admin/all.css', " *= require admin/spree_simple_html_emails\n", :before => /\*\//, :verbose => true
      end

      def add_migrations
        # run 'bundle exec rake railties:install:migrations FROM=spree_simple_html_emails'
      end

      def run_migrations
        # run_migrations = options[:auto_run_migrations] || ['', 'y', 'Y'].include?(ask 'Would you like to run the migrations now? [Y/n]')
        # if run_migrations
          # run 'bundle exec rake db:migrate'
        # else
          # puts 'Skipping rake db:migrate, don\'t forget to run it!'
        #end
      end
    end
  end
end

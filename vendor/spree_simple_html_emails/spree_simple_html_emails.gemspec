# -*- encoding: utf-8 -*-
# stub: spree_simple_html_emails 2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "spree_simple_html_emails"
  s.version = "2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Alex James"]
  s.date = "2014-05-22"
  s.description = "Sends easily configurable, scss powered, localised html multipart emails from spree"
  s.email = "alex.james@200creative.com"
  s.files = [".gitignore", ".rspec", "Gemfile", "LICENSE", "README.md", "Rakefile", "app/assets/javascripts/admin/spree_simple_html_emails.js", "app/assets/javascripts/store/spree_simple_html_emails.js", "app/assets/stylesheets/admin/spree_simple_html_emails.css", "app/assets/stylesheets/store/spree_simple_html_emails.css.scss", "app/mailers/spree/base_mailer_decorator.rb", "app/views/spree/layouts/email.html.erb", "app/views/spree/order_mailer/cancel_email.html.erb", "app/views/spree/order_mailer/cancel_email.text.erb", "app/views/spree/order_mailer/confirm_email.html.erb", "app/views/spree/order_mailer/confirm_email.text.erb", "app/views/spree/shared/email/_footer.html.erb", "app/views/spree/shared/email/_header.html.erb", "app/views/spree/shipment_mailer/shipped_email.html.erb", "app/views/spree/shipment_mailer/shipped_email.text.erb", "app/views/spree/test_mailer/test_email.html.erb", "app/views/spree/test_mailer/test_email.text.erb", "app/views/spree/user_mailer/reset_password_instructions.html.erb", "app/views/spree/user_mailer/reset_password_instructions.text.erb", "bin/rails", "config/initializers/premailer_rails.rb", "config/locales/en.yml", "config/routes.rb", "lib/generators/spree_simple_html_emails/install/install_generator.rb", "lib/generators/spree_simple_html_emails/templates/stylesheets/spree_simple_html_emails.css.scss", "lib/spree_simple_html_emails.rb", "lib/spree_simple_html_emails/engine.rb", "lib/spree_simple_html_emails/factories.rb", "spec/spec_helper.rb", "spree_simple_html_emails.gemspec"]
  s.homepage = "http://www.200creative.com"
  s.licenses = ["GNU-2.0"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.requirements = ["none"]
  s.rubygems_version = "2.2.2"
  s.summary = "Sends easily configurable, scss powered, localised html multipart emails from spree"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<spree_core>, ["~> 2.1"])
      s.add_runtime_dependency(%q<premailer-rails>, [">= 1.6.1", "~> 1.6"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_development_dependency(%q<capybara>, ["~> 2.1"])
      s.add_development_dependency(%q<coffee-rails>, [">= 0"])
      s.add_development_dependency(%q<database_cleaner>, [">= 0"])
      s.add_development_dependency(%q<factory_girl>, ["~> 4.2"])
      s.add_development_dependency(%q<ffaker>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 2.13"])
      s.add_development_dependency(%q<sass-rails>, [">= 0"])
      s.add_development_dependency(%q<selenium-webdriver>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<spree_core>, ["~> 2.1"])
      s.add_dependency(%q<premailer-rails>, [">= 1.6.1", "~> 1.6"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<capybara>, ["~> 2.1"])
      s.add_dependency(%q<coffee-rails>, [">= 0"])
      s.add_dependency(%q<database_cleaner>, [">= 0"])
      s.add_dependency(%q<factory_girl>, ["~> 4.2"])
      s.add_dependency(%q<ffaker>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, ["~> 2.13"])
      s.add_dependency(%q<sass-rails>, [">= 0"])
      s.add_dependency(%q<selenium-webdriver>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<spree_core>, ["~> 2.1"])
    s.add_dependency(%q<premailer-rails>, [">= 1.6.1", "~> 1.6"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<capybara>, ["~> 2.1"])
    s.add_dependency(%q<coffee-rails>, [">= 0"])
    s.add_dependency(%q<database_cleaner>, [">= 0"])
    s.add_dependency(%q<factory_girl>, ["~> 4.2"])
    s.add_dependency(%q<ffaker>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, ["~> 2.13"])
    s.add_dependency(%q<sass-rails>, [">= 0"])
    s.add_dependency(%q<selenium-webdriver>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end

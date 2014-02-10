# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "spree_multi_currency"
  s.version = "2.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gregor MacDougall"]
  s.date = "2014-01-25"
  s.description = "http://www.spreecommerce.com"
  s.email = "gmacdougall@freerunningtechnologies.com"
  s.homepage = "http://www.freerunningtechnologies.com"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.requirements = ["none"]
  s.rubygems_version = "2.0.5"
  s.summary = "Spree Commerce Extension - Provide currency customization"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<spree_core>, ["~> 2.1.3"])
      s.add_runtime_dependency(%q<spree_frontend>, ["~> 2.1.3"])
      s.add_runtime_dependency(%q<spree_backend>, ["~> 2.1.3"])
      s.add_development_dependency(%q<capybara>, ["= 1.0.1"])
      s.add_development_dependency(%q<factory_girl>, ["~> 2.6.4"])
      s.add_development_dependency(%q<ffaker>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 2.9"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<spree_core>, ["~> 2.1.3"])
      s.add_dependency(%q<spree_frontend>, ["~> 2.1.3"])
      s.add_dependency(%q<spree_backend>, ["~> 2.1.3"])
      s.add_dependency(%q<capybara>, ["= 1.0.1"])
      s.add_dependency(%q<factory_girl>, ["~> 2.6.4"])
      s.add_dependency(%q<ffaker>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, ["~> 2.9"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<spree_core>, ["~> 2.1.3"])
    s.add_dependency(%q<spree_frontend>, ["~> 2.1.3"])
    s.add_dependency(%q<spree_backend>, ["~> 2.1.3"])
    s.add_dependency(%q<capybara>, ["= 1.0.1"])
    s.add_dependency(%q<factory_girl>, ["~> 2.6.4"])
    s.add_dependency(%q<ffaker>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, ["~> 2.9"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end

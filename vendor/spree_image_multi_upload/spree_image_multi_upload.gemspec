# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_image_multi_upload'
  s.version     = '1.3.0'
  s.summary     = 'Advanced product images uploader'
  s.description = 'Allow to upload several product images at the same time with drag&drop support'
  s.required_ruby_version = '>= 1.8.7'

  s.author    = 'Maks Sleptsov (Service & Consulting)'
  s.email     = 'service@secoint.ru'
  s.homepage  = 'https://github.com/secoint/spree_image_multi_upload'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.1'

  s.add_development_dependency 'capybara', '~> 1.1.2'
  s.add_development_dependency 'factory_girl', '~> 2.6.4'
  s.add_development_dependency 'rspec-rails',  '~> 2.9'
  s.add_development_dependency 'sqlite3'
end

# encoding: UTF-8
Gem::Specification.new do |s|
  s.name        = 'spree_content_fragments'
  s.version     = '3.3.0'
  s.summary     = 'Adds content fragments to products'
  s.description = 'Allows for more elaborate product pages with images and markup'
  s.required_ruby_version = '>= 2.1.0'

  s.author    = 'mroach'
  s.email     = 'mroach@mroach.com'
  s.homepage  = 'http://github.com/WebGents/spree_content_fragments'
  s.license = 'BSD-3'

  # s.files       = `git ls-files`.split("\n")
  # s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 3.3'

  s.add_development_dependency 'capybara', '~> 2.6'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails', '~> 3.4'
  s.add_development_dependency 'sass-rails', '~> 5.0.0'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'guard-rspec', '>= 4.2.0'
end

$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "voluntary_text_creation/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "voluntary_text_creation"
  s.version     = VoluntaryTextCreation::VERSION
  s.authors     = ["Mathias Gawlista"]
  s.email       = ["gawlista@gmail.com"]
  s.homepage    = "http://github.com/Applicat/voluntary_text_creation"
  s.summary     = "Crowdsourcing product engine about text creation workflow based on crowdsourcing engine voluntary"
  s.description = "Crowdsourcing product engine about text creation workflow based on crowdsourcing engine voluntary"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "voluntary"

  # group :development
  s.add_development_dependency 'letter_opener'

  # for tracing AR object instantiation and memory usage per request
  s.add_development_dependency 'oink'

  # group :development, :test
  s.add_development_dependency 'awesome_print'
  s.add_development_dependency 'rspec-rails', '~> 2.0' 
  
  # group :test
  s.add_development_dependency 'capybara', '~> 1.1.2'
  s.add_development_dependency 'capybara-webkit'
  s.add_development_dependency 'cucumber-rails-training-wheels'
  s.add_development_dependency 'timecop'
  s.add_development_dependency 'factory_girl_rails', '1.7.0'
  s.add_development_dependency 'fixture_builder', '0.3.3'
  s.add_development_dependency 'fuubar', '>= 1.0'
  s.add_development_dependency 'selenium-webdriver', '~> 2.22.1'
  s.add_development_dependency 'spork', '~> 1.0rc2'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-spork'
  s.add_development_dependency 'guard-cucumber'
  s.add_development_dependency 'launchy'

  # group :cucumber, :test
  s.add_development_dependency 'database_cleaner', '0.7.1'
end

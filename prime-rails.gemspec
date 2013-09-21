$:.push File.expand_path("../lib", __FILE__)
require "prime/rails/version"

Gem::Specification.new do |s|
  s.name        = 'prime-rails'
  s.version     = Prime::Rails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Lazaro Nixon"]  
  s.email       = ["lazaronixon@hotmail.com"]  
  s.homepage    = "https://github.com/lazaronixon/prime-rails"  
  s.summary     = "PrimeUI components for Rails"
  s.description = "prime-rails Create helpers for PrimeUI Components"
  s.license = 'Apache V2'
  s.add_dependency 'jquery-rails'


  
  s.rubyforge_project = "prime-rails"
  s.files       = Dir["lib/**/*"] + Dir["vendor/**/*"] + Dir["app/**/*"]
  s.require_paths = ["lib"]
  
end
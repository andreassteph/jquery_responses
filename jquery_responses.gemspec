$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "jquery_responses/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "jquery_responses"
  s.version     = JqueryResponses::VERSION
  s.authors     = ["Andreas Stephanides"]
  s.email       = ["andreas.stephanides@gmail.com"]
  s.homepage    = ""
  s.summary     = ": Summary of JqueryResponses."
  s.description = ": Description of JqueryResponses."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"

  s.add_development_dependency "sqlite3"
end

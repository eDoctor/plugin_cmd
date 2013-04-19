$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "plugin_cmd/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "plugin_cmd"
  s.version     = PluginCmd::VERSION
  s.authors     = ["Richie Min"]
  s.email       = ["minruiqi@gmail.com"]
  s.homepage    = "https://github.com/eDoctor/plugin_cmd"
  s.summary     = "command line tools"
  s.description = "used for generate mountable gems"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.11"

end

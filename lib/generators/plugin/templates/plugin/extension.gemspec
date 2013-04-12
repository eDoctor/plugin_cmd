# encoding: UTF-8
version = File.read(File.expand_path("../../VERSION", __FILE__)).strip

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = '<%= module_name %>_<%= file_name %>'
  s.version     = version
  s.summary     = 'TODO: Add gem summary here'
  s.description = 'TODO: Add (optional) gem description here'
  s.required_ruby_version = '>= 1.9.3'

  # s.author    = 'You'
  # s.email     = 'you@example.com'
  # s.homepage  = 'http://github.com'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'course_core', version

end

require 'thor'
class PluginGenerator < Rails::Generators::NamedBase

  desc "builds a module extension"
  #argument :file_name, :type => :string, :desc => 'rails extention app_path', :default => '.'
  argument :mod, :type => :string, :desc => 'rails module app_path', :default => '.'

  class_option :path, :type => :string, :default => false,
    :desc => "Path for your templates"

  source_root File.expand_path('../templates/plugin', __FILE__)

  def generate
    puts name
    puts file_name
    puts mod

    path = options[:path] ? "#{options[:path]}/" : nil

    empty_directory "#{path}file_name"

    directory 'app', "#{path}#{file_name}/app"
    directory 'lib', "#{path}#{file_name}/lib"
    directory 'script', "#{path}#{file_name}/script"

    template 'extension.gemspec', "#{path}#{file_name}/#{file_name}.gemspec"
    template 'Gemfile', "#{path}#{file_name}/Gemfile"
    template 'gitignore', "#{path}#{file_name}/.gitignore"
    template 'LICENSE', "#{path}#{file_name}/LICENSE"
    template 'Rakefile', "#{path}#{file_name}/Rakefile"
    template 'README.md', "#{path}#{file_name}/README.md"
    template 'config/routes.rb', "#{path}#{file_name}/config/routes.rb"
    template 'config/locales/en.yml', "#{path}#{file_name}/config/locales/en.yml"
    template 'rspec', "#{path}#{file_name}/.rspec"
    template 'spec/spec_helper.rb.tt', "#{path}#{file_name}/spec/spec_helper.rb"
    template 'Versionfile', "#{path}#{file_name}/Versionfile"
  end

  no_tasks do

    def class_name
      Thor::Util.camel_case file_name
    end

    def module_name
      Thor::Util.snake_case mod
    end

    def module_label
      Thor::Util.camel_case mod
    end

    def file_name
      @file_name = Thor::Util.snake_case(name)
    end

    def course_version
      '0.0.1'
    end

    def use_prefix(prefix)
      unless file_name =~ /^#{prefix}/
        @file_name = prefix + Thor::Util.snake_case(file_name)
      end
    end
  end

end

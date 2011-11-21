# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "radiant-reader_mailman-extension"

Gem::Specification.new do |s|
  s.name        = "radiant-reader_mailman-extension"
  s.version     = RadiantReaderMailmanExtension::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = RadiantReaderMailmanExtension::AUTHORS
  s.email       = RadiantReaderMailmanExtension::EMAIL
  s.homepage    = RadiantReaderMailmanExtension::URL
  s.summary     = RadiantReaderMailmanExtension::SUMMARY
  s.description = RadiantReaderMailmanExtension::DESCRIPTION

  ignores = if File.exist?('.gitignore')
    File.read('.gitignore').split("\n").inject([]) {|a,p| a + Dir[p] }
  else
    []
  end
  s.files         = Dir['**/*'] - ignores
  s.test_files    = Dir['test/**/*','spec/**/*','features/**/*'] - ignores
  # s.executables   = Dir['bin/*'] - ignores
  s.require_paths = ["lib"]

  s.post_install_message = %{
  Add this to your radiant project with a line in your Gemfile:

    gem 'radiant-reader_mailman-extension', '~> #{RadiantReaderMailmanExtension::VERSION}'

  }

end
# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "radiant-heroku_dalli-extension"

Gem::Specification.new do |s|
  s.name        = "radiant-heroku_dalli-extension"
  s.version     = RadiantHerokuDalliExtension::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = RadiantHerokuDalliExtension::AUTHORS
  s.email       = RadiantHerokuDalliExtension::EMAIL
  s.homepage    = RadiantHerokuDalliExtension::URL
  s.summary     = RadiantHerokuDalliExtension::SUMMARY
  s.description = RadiantHerokuDalliExtension::DESCRIPTION

  # Define gem dependencies here.
  # Don't include a dependency on radiant itself: it causes problems when radiant is in vendor/radiant.
  s.add_dependency "dalli", "~> 1.0.4"
  s.add_dependency "kgio",  "~> 2.7.2"

  ignores = if File.exist?('.gitignore')
    File.read('.gitignore').split("\n").inject([]) {|a,p| a + Dir[p] }
  else
    []
  end
  s.files         = Dir['**/*'] - ignores
  s.test_files    = Dir['test/**/*','spec/**/*','features/**/*'] - ignores
  # s.executables   = Dir['bin/*'] - ignores
  s.require_paths = ["lib"]
end

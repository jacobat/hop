# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hop/version"

Gem::Specification.new do |s|
  s.name        = "hop"
  s.version     = Hop::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jacob Atzen"]
  s.email       = ["jacob@jacobatzen.dk"]
  s.homepage    = ""
  s.summary     = %q{Shortcut aliases to open from the commandline}
  s.description = %q{Shortcut aliases to open from the commandline, yay!}

  s.rubyforge_project = "hop"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

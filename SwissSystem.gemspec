# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "SwissSystem/version"

Gem::Specification.new do |s|
  s.name        = "SwissSystem"
  s.version     = SwissSystem::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mariusz Koziel"]
  s.email       = ["adept_koza@o2.pl"]
  s.homepage    = ""
  s.summary     = %q{Swiss System Turnament}
  s.description = %q{Aplication to swiss system turnament}

  s.rubyforge_project = "SwissSystem"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

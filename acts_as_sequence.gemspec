# encoding: utf-8

$:.push File.expand_path("../lib", __FILE__)
require "acts_as_sequence/version"

Gem::Specification.new do |s|
  s.name              = "acts_as_sequence"
  s.version           = ActsAsSequence::VERSION
  s.author            = "Victor Sokolov"
  s.email             = "gzigzigzeo@gmail.com"
  s.homepage          = "http://github.com/gzigzigzeo/acts_as_sequence"
  s.description       = "Emulates sequence in MySQL database. Useful when you want your newly created object to have unique id value."
  s.summary           = "Database sequence emulation for MySQL"

  s.rubyforge_project = "acts_as_sequence"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency 'activerecord', '~> 3.0.0'
  s.add_dependency 'activesupport', '~> 3.0.0'  
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec'
end
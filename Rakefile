require 'rake'
require 'rake/testtask'
require 'rspec/core'
require 'rspec/core/rake_task'
require 'acts_as_sequence'

RSpec::Core::RakeTask.new(:spec)
task :default => :spec

begin
  require "jeweler"
  Jeweler::Tasks.new do |s|
    s.name              = "acts_as_sequence"
    s.version           = ActsAsSequence::VERSION
    s.author            = "Victor Sokolov"
    s.email             = "gzigzigzeo@gmail.com"
    s.homepage          = "http://github.com/gzigzigzeo/acts_as_sequence"
    s.description       = "Emulates sequence in MySQL database. Useful when you want your newly created object to have unique id value."
    s.summary           = "Database sequence emulation for MySQL"
    s.platform          = Gem::Platform::RUBY
    s.files             = `git ls-files`.split("\n")
    s.test_files        = `git ls-files -- {test,spec,features}/*`.split("\n")
    s.executables       = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
    s.require_path      = "lib"
#    s.rubyforge_project = "acts_as_sequence"
    s.has_rdoc          = false
    s.add_dependency 'activerecord', "~> 3.0.0"
  end
  
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

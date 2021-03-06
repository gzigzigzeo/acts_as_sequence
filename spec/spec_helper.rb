$LOAD_PATH << "." unless $LOAD_PATH.include?(".")

require 'logger'
require "bundler"
  
begin
  Bundler.setup
  Bundler.require  
rescue Bundler::GemNotFound
  raise RuntimeError, "Bundler couldn't find some gems." +
    "Did you run `bundle install`?"
end

require 'active_record'

ActiveRecord::Base.send(:include, ActsAsSequence::Extension)
ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3", 
  "database" => ":memory:"
)

ActiveRecord::Base.logger = Logger.new(nil)

load(File.dirname(__FILE__) + '/schema.rb')
$: << File.join(File.dirname(__FILE__), '..', 'lib')

class Sequence < ActiveRecord::Base
  acts_as_sequencer
end

class Item < ActiveRecord::Base
  acts_as_sequenced :new_id1, Sequence
  acts_as_sequenced :new_id2, Sequence, :sequence => :id_2_sequence
end
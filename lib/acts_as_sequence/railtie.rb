# encoding: utf-8
module ActsAsSequence
  class Railtie < ::Rails::Railtie
    ActiveSupport.on_load :active_record do
      ::ActiveRecord::Base.send(:include, ActsAsSequence::Extension)
    end
  end
end
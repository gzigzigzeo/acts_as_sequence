require 'active_support/concern'

module ActsAsSequence
  module ActsAsSequence
    extend ::ActiveSupport::Concern

    module ClassMethods
      def acts_as_sequenced(field, sequencer, *args)
        field = field.to_sym
        options = args.extract_options!
        sequence_name = options.delete(:sequence) || "#{field}_#{self.name.underscore}"

        after_initialize do
          write_attribute(field, sequencer.next_sequence_value(sequence_name)) if read_attribute(field).blank? && new_record?
        end

        (class << self; self; end).send(:define_method, :"next_sequence_#{field}") do
          sequencer.next_sequence_value(sequence_name)
        end
      end

      def acts_as_sequencer
        class_eval do
          def self.next_sequence_value(sequence)
            raise ArgumentError, "Sequence column #{sequence} not found in model #{name}" unless column_names.include?(sequence.to_s)
            transaction do
              record = first(:lock => true)
              record = create! if record.nil?
              value = record[sequence].to_i
              record[sequence] = value + 1
              record.save!
              value
            end
          end
        end
      end
    end
  end
end
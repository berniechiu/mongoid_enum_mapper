module Mongoid
  module EnumMapper
    extend ActiveSupport::Concern

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def define_enum(enum_field, enum_mapping = {})
        field :"#{enum_field}", type: Integer, default: 0

        enum_value = :"@#{enum_field}"

        define_method(enum_field) do
          instance_variable_get(enum_value) || instance_variable_set(enum_value, enum_mapping.find { |_, value| value == self[enum_field] }.try(:[], 0))
        end

        define_method(:"#{enum_field}=") do |key|
          return self[enum_field] unless enum_mapping[key]
          instance_variable_set(enum_value, nil) # clean mapping cache
          self[enum_field] = enum_mapping[key]
        end
      end
    end
  end
end

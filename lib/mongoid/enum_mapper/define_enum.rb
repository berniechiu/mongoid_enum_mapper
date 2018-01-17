require 'pry'
module Mongoid
  module EnumMapper
    extend ActiveSupport::Concern

    def self.included(base)
      base.extend(ClassMethods)
    end

    def reload
      super
      reset_enum_mapping_cache
      self
    end

    def reset_enum_mapping_cache(enum_field: nil, key: nil)
      if enum_field
        # Reset certain enum field
        enum_mapper = self.class.const_get(enum_field.to_s.upcase)
        key ||= enum_mapper.key(self[:"#{enum_field}"])  # If key not found, grep from current db value
        return self[enum_field] unless enum_mapper[key]
        instance_variable_set(:"@#{enum_field}", nil) if self.status != enum_mapper[key]
        self[enum_field] = enum_mapper[key]
      else
        # Reset all enum field
        self.class.instance_variable_get(:'@current_enums').each do |field|
          reset_enum_mapping_cache(enum_field: field)
        end
      end
    end

    module ClassMethods
      def define_enum(enum_field, enum_mapping = {})
        field :"#{enum_field}", type: Integer, default: 0
        set_enum_mapping_constant(enum_field, enum_mapping)
        set_current_enum_fields(enum_field)

        enum_value = :"@#{enum_field}"

        define_method(enum_field) do
          instance_variable_get(enum_value) ||
          instance_variable_set(enum_value, enum_mapping.find { |_, value| value == self[enum_field] }.try(:[], 0))
        end

        define_method(:"#{enum_field}=") do |key|
          reset_enum_mapping_cache(enum_field: enum_field, key: key)
        end
      end

      def set_enum_mapping_constant(name, value)
        const_name = name.to_s.upcase
        const_set(const_name, value.freeze)
      end

      def set_current_enum_fields(name)
        @current_enums ||= []
        @current_enums << name.to_s
      end
    end
  end
end

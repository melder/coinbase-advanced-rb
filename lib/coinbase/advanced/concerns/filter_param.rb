# frozen_string_literal: true

module Coinbase
  module Advanced
    module Concerns
      # FilterParam is a concern that provides a way to filter sensitive parameters from being logged
      # Similar to rails filter_parameters
      # https://api.rubyonrails.org/classes/ActionDispatch/Http/FilterParameters.html
      module FilterParam
        def original_inspect
          inspect
        end

        def formatted_instance_variables
          instance_variables.sort.map do |var|
            value = @filter_params.include?(var) ? "[FILTERED]" : instance_variable_get(var).inspect
            "#{var}=#{value}"
          end
        end

        def inspect
          "#<#{self.class}: #{formatted_instance_variables.join(', ')}>"
        end

        def pretty_print(pp)
          pp.object_group(self) do
            instance_variables.sort.each do |var|
              pp.breakable
              value = @filter_params.include?(var) ? "[FILTERED]" : instance_variable_get(var)
              pp.text "#{var}="
              pp.pp value
            end
          end
        end
      end
    end
  end
end

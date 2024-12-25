# frozen_string_literal: true

module Coinbase
  module Advanced
    class Configuration
      SENSITIVE_VARS = %i[@api_key @api_secret].freeze

      attr_accessor :api_key, :api_secret, :base_url, :timeout, :verbose, :logger

      def initialize
        @base_url = "https://api.coinbase.com"
        @timeout = 30
        @verbose = false
        @logger = nil
      end

      def setup
        yield(self) if block_given?
      end

      def log_level=(level)
        valid_levels = %i[debug info warn error fatal]
        raise ArgumentError, "Invalid log level" unless valid_levels.include?(level)

        @log_level = level
      end

      def log(message, level = :info)
        return unless @logger

        @logger.send(level, message)
      end

      # Filter out sensitive config from logs / console output
      alias original_inspect inspect

      def formatted_instance_variables
        instance_variables.sort.map do |var|
          value = SENSITIVE_VARS.include?(var) ? "[FILTERED]" : instance_variable_get(var).inspect
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
            value = SENSITIVE_VARS.include?(var) ? "[FILTERED]" : instance_variable_get(var)
            pp.text "#{var}="
            pp.pp value
          end
        end
      end
    end
  end
end

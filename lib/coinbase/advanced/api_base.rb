# frozen_string_literal: true

module Coinbase
  module Advanced
    # APIBase serves primarily to store state required for authentication (REST / Websocket)
    # In addition it should house any contexts / configurations that are shared between communication protocols
    class APIBase
      SENSITIVE_VARS = %i[@api_key @api_secret].freeze

      def initialize(**kwargs)
        key_file = kwargs[:key_file]
        api_key = kwargs[:api_key]
        api_secret = kwargs[:api_secret]

        if key_file
          if api_key || api_secret
            raise ArgumentError,
                  "Ambiguous authentication scheme: use either api_key + api_secret OR key_file"
          end
          @key_file = key_file
          @api_key, @api_secret = parse_key_file
        else
          @key_file = nil

          @api_key = api_key || ENV.fetch(API_ENV_KEY, nil)
          raise ArgumentError, "Missing API Key" unless @api_key

          @api_secret = api_secret || ENV.fetch(API_SECRET_ENV_KEY, nil)
          raise ArgumentError, "Missing API Secret" unless @api_secret
        end

        @base_url = kwargs[:base_url] || BASE_URL
        @timeout = kwargs[:timeout]
        @verbose = kwargs[:verbose]

        @authenticated = true
      end

      def parse_key_file
        name = JSON_API_KEY
        secret = JSON_API_SECRET

        js = JSON.parse(File.read(@key_file))
        unless js.key?(name) && js.key?(secret)
          raise KeyError, "Missing required key '#{name}' and / or '#{secret}' from #{@key_file}"
        end

        [js[name], js[secret]]
      end

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

# frozen_string_literal: true

module Coinbase
  module Advanced
    # APIBase serves primarily to store state required for authentication (REST / Websocket)
    # In addition it should house any contexts / configurations that are shared between communication protocols
    class APIBase
      JSON_API_KEY = "name"
      JSON_API_SECRET = "privateKey"

      def initialize(config = Coinbase::Advanced.config)
        @config = config

        @key_file = config&.key_file
        @api_key = config&.api_key
        @api_secret = config&.api_secret

        @base_url = config&.base_url
        @timeout = config&.timeout

        @authenticated = authenticate
        @config.log("Authentication failed. You may only access public endpoints.", :warn) unless @authenticated
      end

      def authenticate
        if @key_file
          if @api_key && @api_secret
            @config.log "Ambiguous authentication scheme: use either api_key + api_secret OR key_file.", :warn
            @config.log "Defaulting to key_file credentials", :warn
          end
          parse_key_file
        end

        @api_key && @api_secret
      end

      def parse_key_file
        js = JSON.parse(File.read(@key_file))
        @api_key = js[JSON_API_KEY]
        @api_secret = js[JSON_API_SECRET]
      rescue StandardError => e
        @config.log "Failed to parse JSON key file: #{e.message}", :error
      end
    end
  end
end

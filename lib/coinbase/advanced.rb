# frozen_string_literal: true

require "json"
require "faraday"

require "jwt"
require "openssl"
require "time"
require "securerandom"

require_relative "advanced/constants"
require_relative "advanced/configuration"
require_relative "advanced/api_base"
require_relative "advanced/version"

require_relative "advanced/rest/resources/futures"
require_relative "advanced/rest/resources/products"
require_relative "advanced/rest/resources/public"
require_relative "advanced/rest/resources/orders"

require_relative "advanced/rest/base_response"
require_relative "advanced/rest/rest_base"

module Coinbase
  module Advanced
    @config = Configuration.new

    class << self
      extend Forwardable

      attr_reader :config

      def_delegators :@config, :api_key, :api_secret, :base_url, :timeout, :verbose, :logger, :log_level, :log

      def configure
        yield(@config) if block_given?
      end
    end
  end
end

# frozen_string_literal: true

require "json"
require "faraday"

require "jwt"
require "openssl"
require "time"
require "securerandom"

require_relative "advanced/concerns/filter_param"

require_relative "advanced/constants"
require_relative "advanced/api_base"
require_relative "advanced/version"

require_relative "advanced/rest/resources/futures"
require_relative "advanced/rest/resources/products"
require_relative "advanced/rest/resources/public"
require_relative "advanced/rest/resources/orders"

require_relative "advanced/rest/base_response"
require_relative "advanced/rest/rest_base"

class Configuration
  DEFAULT_API_BASE_URL = "api.coinbase.com"
  DEFAULT_API_PREFIX = "/api/v3/brokerage"

  DEFAULT_LOGGER = Logger.new($stdout)
  DEFAULT_LOG_LEVEL = Logger::INFO

  DEFAULT_SENSITIVE_PARAMS = %i[@api_key @api_secret].freeze

  include Coinbase::Advanced::Concerns::FilterParam

  attr_accessor :base_url, :api_prefix, :key_file, :api_key, :api_secret,
                :timeout, :verbose, :filter_params

  attr_reader :logger, :log_level

  def initialize
    @base_url = DEFAULT_API_BASE_URL
    @api_prefix = DEFAULT_API_PREFIX
    @timeout = 30

    @key_file = ENV.fetch("COINBASE_JSON_KEY_FILE", nil)
    @api_key = ENV.fetch("COINBASE_API_KEY", nil)
    @api_secret = ENV.fetch("COINBASE_API_SECRET", nil)

    @logger = DEFAULT_LOGGER
    @logger.level = DEFAULT_LOG_LEVEL
    @verbose = false
    @filter_params = DEFAULT_SENSITIVE_PARAMS
  end

  def setup
    yield(self) if block_given?
  end

  # Currently only supporting default logger
  def logger=(logger)
    raise ArgumentError, "Only default logger supported" unless logger.is_a?(Logger)

    @logger = logger
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
end

# inspired by https://github.com/stripe/stripe-ruby/blob/master/lib/stripe.rb
# TODO: this probably is redundant because:
# A. configuration class is defined right above
# B. def_delegators here are equivalent to attr_accessor
# Keeping it here for time being until a Stripe engineer gets back to me
module Coinbase
  module Advanced
    @config = Configuration.new

    class << self
      extend Forwardable

      attr_reader :config

      # User configurable options
      def_delegators :@config, :base_url, :base_url=
      def_delegators :@config, :api_prefix, :api_prefix=
      def_delegators :@config, :key_file, :key_file=
      def_delegators :@config, :api_key, :api_key=
      def_delegators :@config, :api_secret, :api_secret=
      def_delegators :@config, :timeout, :timeout=
      def_delegators :@config, :verbose, :verbose=
      def_delegators :@config, :logger, :log_level=
      def_delegators :@config, :log_level, :log_level=
      def_delegators :@config, :filter_params, :filter_params=

      def configure
        yield(@config) if block_given?
      end
    end
  end
end

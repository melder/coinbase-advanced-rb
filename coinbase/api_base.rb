# frozen_string_literal: true

require "json"
require_relative "constants"

class APIBase
  def initialize(**kwargs)
    key_file = kwargs[:key_file]
    api_key = kwargs[:api_key]
    api_secret = kwargs[:api_secret]

    if key_file
      if api_key || api_secret
        raise ArgumentError,
              "Ambiguous authentication scheme: use either api_key + api_secret OR key_file"
      end
    else
      raise ArgumentError, "Missing API Key" unless api_key
      raise ArgumentError, "Missing API Secret" unless api_secret
    end

    if key_file
      @key_file = key_file
      @api_key, @api_secret = parse_key_file
    else
      @key_file = nil
      @api_key = api_key || ENV.fetch(API_ENV_KEY, nil)
      @api_secret = api_secret || ENV.fetch(API_SECRET_ENV_KEY, nil)
    end

    @base_url = kwargs[:base_url]
    @timeout = kwargs[:timeout]
    @verbose = kwargs[:verbose]
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
end

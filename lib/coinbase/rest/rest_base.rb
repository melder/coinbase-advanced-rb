# frozen_string_literal: true

module Coinbase
  module REST
    # RESTBase sets up, executes, and appropriately handles errors strictly within context of HTTP + REST communication
    class RESTBase < Coinbase::APIBase
      attr_reader :session

      include Products
      include Public

      def initialize(**kwargs)
        super
        @session = Faraday.new
      end

      def set_headers(method, path)
        uri = "#{method} #{@base_url}#{path}"

        @session.headers = {
          "User-Agent" => Coinbase::USER_AGENT,
          "Content-Type" => "application/json"
        }

        @session.headers["Authorization"] = "Bearer #{build_jwt(uri)}" if @authenticated
      end

      # copied rb sample from https://docs.cdp.coinbase.com/advanced-trade/docs/ws-auth#code-samples
      # See README if confused why this method is here
      def build_jwt(uri = nil)
        header = {
          typ: "JWT",
          kid: @api_key,
          nonce: SecureRandom.hex(16)
        }

        claims = {
          sub: @api_key,
          iss: "cdp",
          aud: ["cdp_service"],
          nbf: Time.now.to_i,
          exp: Time.now.to_i + 120 # Expiration time: 2 minute from now.
        }

        claims[:uri] = uri if uri

        private_key = OpenSSL::PKey.read(@api_secret)
        JWT.encode(claims, private_key, "ES256", header)
      end

      def prepare_and_send_request(http_method, url_path, params = {}, data = {}, _public = false)
        if !_public && !@authenticated
          raise AuthenticationError,
                <<~HEREDOC
                  Unauthenticated request to private endpoint. If you wish to access private endpoints, you must \
                  provide your API key and secret when initializing the RESTClient.
                HEREDOC
        end

        set_headers(http_method, url_path)
        @session.params = params unless params.empty?
        @session.body = data.to_json unless data.empty?
        url_path.insert(0, "/") if url_path[0] != "/"

        send_request(http_method, url_path)
      end

      # def send_request(http_method, url_path, params, headers, data = None) - py method signature, lot of redundant shit
      def send_request(http_method, url_path)
        url = URI::HTTPS.build(host: @base_url, path: url_path).to_s

        puts "Sending #{http_method} to #{url}"

        # doesn't mesh well with faraday, will need to refactor
        case http_method
        when :get then res = @session.get(url)
        when :post then res = @session.post(url)
        else
          raise URI::BadURIError, "Unknown HTTP method / verb: '#{http_method}'"
        end

        puts(res.inspect)

        BaseResponse.new(JSON.parse(res.body))
      end

      def get(url_path, params = {}, auth_required: True, **kwargs)
        params.merge! kwargs unless kwargs.empty?
        prepare_and_send_request(:get, url_path, params, {}, auth_required)
      end
    end

    class AuthenticationError < StandardError
    end
  end
end

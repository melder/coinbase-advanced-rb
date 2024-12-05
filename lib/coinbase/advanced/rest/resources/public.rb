# frozen_string_literal: true

module Coinbase
  module Advanced
    module REST
      module Resources
        module Public
          def server_time
            endpoint = "#{Coinbase::Advanced::API_PREFIX}/time"
            get(endpoint, {}, auth_required: false)
          end

          def public_product_book(params = {})
            raise ArgumentError, "Missing :product_id" unless params.key? :product_id

            endpoint = "#{Coinbase::Advanced::API_PREFIX}/market/product_book"
            get(endpoint, params, auth_required: false)
          end

          def list_public_products(params = {})
            endpoint = "#{Coinbase::Advanced::API_PREFIX}/market/products"
            get(endpoint, params, auth_required: false)
          end

          def public_product(product_id, params = {})
            raise ArgumentError, "Missing product_id" if product_id.empty?

            endpoint = "#{Coinbase::Advanced::API_PREFIX}/market/products/#{product_id}"
            get(endpoint, params, auth_required: false)
          end

          def public_product_candles(product_id, params = {})
            raise ArgumentError, "Missing product_id" if product_id.empty?
            raise ArgumentError, "Missing :start" unless params.key? :start
            raise ArgumentError, "Missing :end" unless params.key? :end
            raise ArgumentError, "Missing :granularity" unless params.key? :granularity

            endpoint = "#{Coinbase::Advanced::API_PREFIX}/market/products/#{product_id}/candles"
            get(endpoint, params, auth_required: false)
          end

          def public_market_trades(product_id, params = {})
            raise ArgumentError, "Missing product_id" if product_id.empty?
            raise ArgumentError, "Missing :limit" unless params.key? :limit

            endpoint = "#{Coinbase::Advanced::API_PREFIX}/market/products/#{product_id}/ticker"
            get(endpoint, params, auth_required: false)
          end
        end
      end
    end
  end
end

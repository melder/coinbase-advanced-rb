# frozen_string_literal: true

module Coinbase
  module Advanced
    module REST
      module Resources
        module Products
          def best_bid_ask(params = {})
            endpoint = "#{Coinbase::Advanced::API_PREFIX}/best_bid_ask"
            get(endpoint, params)
          end

          def product_book(product_id, params = {})
            raise ArgumentError, "Missing product_id" if product_id.empty?

            endpoint = "#{Coinbase::Advanced::API_PREFIX}/product_book"
            get(endpoint, params)
          end

          def products(params = {})
            endpoint = "#{Coinbase::Advanced::API_PREFIX}/products"
            get(endpoint, params)
          end

          def product(product_id, params = {})
            raise ArgumentError, "Missing product_id" if product_id.empty?

            endpoint = "#{Coinbase::Advanced::API_PREFIX}/products/#{product_id}"
            get(endpoint, params)
          end

          def product_candles(product_id, params = {})
            raise ArgumentError, "Missing product_id" if product_id.empty?
            raise ArgumentError, "Missing :start" unless params.key? :start
            raise ArgumentError, "Missing :end" unless params.key? :end
            raise ArgumentError, "Missing :granularity" unless params.key? :granularity

            endpoint = "#{Coinbase::Advanced::API_PREFIX}/products/#{product_id}/candles"
            get(endpoint, params)
          end

          def market_trades(product_id, params = {})
            raise ArgumentError, "Missing product_id" if product_id.empty?
            raise ArgumentError, "Missing :limit" unless params.key? :limit

            endpoint = "#{Coinbase::Advanced::API_PREFIX}/products/#{product_id}/ticker"
            get(endpoint, params)
          end
        end
      end
    end
  end
end
# class ListProductsResponse < BaseResponse
#   def initialize()
# end

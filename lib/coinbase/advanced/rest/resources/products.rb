# frozen_string_literal: true

module Coinbase
  module Advanced
    module REST
      module Resources
        module Products
          def get_best_bid_ask(params = {})
            get("best_bid_ask", params)
          end

          def get_product_book(params = {})
            raise ArgumentError, "Missing :product_id" unless params.key? :product_id

            get("product_book", params)
          end

          def list_products(params = {})
            get("products", params)
          end

          def get_product(params = {})
            raise ArgumentError, "Missing :product_id" unless params.key? :product_id

            get("products/#{params[:product_id]}", params)
          end

          def get_product_candles(params = {})
            raise ArgumentError, "Missing :product_id" unless params.key? :product_id
            raise ArgumentError, "Missing :start" unless params.key? :start
            raise ArgumentError, "Missing :end" unless params.key? :end
            raise ArgumentError, "Missing :granularity" unless params.key? :granularity

            get("products/#{params[:product_id]}/candles", params)
          end

          def get_market_trades(params = {})
            raise ArgumentError, "Missing :product_id" unless params.key? :product_id
            raise ArgumentError, "Missing :limit" unless params.key? :limit

            get("products/#{params[:product_id]}/ticker", params)
          end
        end
      end
    end
  end
end

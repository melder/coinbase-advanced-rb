# frozen_string_literal: true

module Coinbase
  module Advanced
    module REST
      module Resources
        module Public
          def server_time
            get("time", {}, auth_required: false)
          end

          def public_product_book(params = {})
            raise ArgumentError, "Missing :product_id" unless params.key? :product_id

            get("market/product_book", params, auth_required: false)
          end

          def list_public_products(params = {})
            get("market/products", params, auth_required: false)
          end

          def public_product(params = {})
            raise ArgumentError, "Missing :product_id" unless params.key? :product_id

            get("market/products/#{params[:product_id]}", params, auth_required: false)
          end

          def public_product_candles(params = {})
            raise ArgumentError, "Missing :product_id" unless params.key? :product_id
            raise ArgumentError, "Missing :start" unless params.key? :start
            raise ArgumentError, "Missing :end" unless params.key? :end
            raise ArgumentError, "Missing :granularity" unless params.key? :granularity

            get("market/products/#{params[:product_id]}/candles", params, auth_required: false)
          end

          def public_market_trades(params = {})
            raise ArgumentError, "Missing :product_id" unless params.key? :product_id
            raise ArgumentError, "Missing :limit" unless params.key? :limit

            get("market/products/#{params[:product_id]}/ticker", params, auth_required: false)
          end
        end
      end
    end
  end
end

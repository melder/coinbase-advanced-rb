# frozen_string_literal: true

module Coinbase
  module Advanced
    module REST
      module Resources
        module Orders
          def create_order(params = {})
            raise ArgumentError, "Missing product_id" unless params.key? :product_id
            raise ArgumentError, "Missing :start" unless params.key? :start
            raise ArgumentError, "Missing :end" unless params.key? :end
            raise ArgumentError, "Missing :granularity" unless params.key? :granularity

            endpoint = "#{CoinbaseAdvanced::API_PREFIX}/orders"
            post(endpoint, {}, params)
          end

          def cancel_orders(params = {}); end

          def edit_order(params = {}); end

          def edit_order_preview(params = {}); end

          def order(params = {}); end

          def orders(params = {}); end

          def fills(params = {}); end

          def preview_order(params = {}); end

          def close_positions(params = {}); end

          # See TODO.md #8
          alias get_order order

          alias get_orders orders
          alias list_orders orders

          alias get_order_fills fills
          alias list_fills fills
        end
      end
    end
  end
end

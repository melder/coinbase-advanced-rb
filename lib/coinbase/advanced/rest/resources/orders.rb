# frozen_string_literal: true

module Coinbase
  module Advanced
    module REST
      module Resources
        module Orders
          # See TODO.md #8
          alias_method :get_order, :order

          alias_method :get_orders, :orders
          alias_method :list_orders, :orders

          alias_method :get_order_fills, :fills
          alias_method :list_fills, :fills


          def create_order(params = {})
            raise ArgumentError, "Missing product_id" unless params.key? :product_id
            raise ArgumentError, "Missing :start" unless params.key? :side
            raise ArgumentError, "Missing :end" unless params.key? :order_configuration
            raise ArgumentError, "Missing :granularity" unless params.key? :client_order_id

            endpoint = "#{CoinbaseAdvanced::API_PREFIX}/orders"
            post(endpoint, {}, params)
          end

          def cancel_orders(params = {})
          end

          def edit_order(params = {})
          end

          def edit_order_preview(params = {})
          end

          def order(params = {})
          end

          def orders(params = {})
          end

          def fills(params = {})
          end

          def preview_order(params = {})
          end

          def close_positions(params = {})
          end
        end
      end
    end
  end
end

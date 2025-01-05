# frozen_string_literal: true

module Coinbase
  module Advanced
    module REST
      module Resources
        # https://docs.cdp.coinbase.com/advanced-trade/reference/retailbrokerageapi_postorder
        module Orders
          def create_order(params = {})
            raise ArgumentError, "Missing client_order_id" unless params.key? :client_order_id
            raise ArgumentError, "Missing product_id" unless params.key? :product_id
            raise ArgumentError, "Missing side" unless params.key? :side
            raise ArgumentError, "Missing order_configuration" unless params.key? :order_configuration

            post("orders", params)
          end

          def cancel_orders(params = {})
            raise ArgumentError, "Missing order_ids" unless params.key? :order_ids

            post("orders/batch_cancel", params)
          end

          def edit_order(params = {})
            raise ArgumentError, "Missing order_id" unless params.key? :order_id
            raise ArgumentError, "Missing price" unless params.key? :price
            raise ArgumentError, "Missing size" unless params.key? :size

            post("orders/edit", params)
          end

          def edit_order_preview(params = {})
            raise ArgumentError, "Missing order_id" unless params.key? :order_id
            raise ArgumentError, "Missing price" unless params.key? :price
            raise ArgumentError, "Missing size" unless params.key? :size

            post("orders/edit_preview", params)
          end

          def get_order(params = {})
            raise ArgumentError, "Missing order_id" unless params.key? :order_id

            order_id = params.delete(:order_id)
            get("orders/historical/#{order_id}", params)
          end

          def list_orders(params = {})
            get("orders/historical/batch", params)
          end

          def list_fills(params = {})
            get("orders/historical/fills", params)
          end

          def preview_order(params = {})
            raise ArgumentError, "Missing product_id" unless params.key? :product_id
            raise ArgumentError, "Missing side" unless params.key? :side
            raise ArgumentError, "Missing order_configuration" unless params.key? :order_configuration

            post("orders/preview", params)
          end

          def close_position(params = {})
            raise ArgumentError, "Missing client_order_id" unless params.key? :client_order_id
            raise ArgumentError, "Missing product_id" unless params.key? :product_id

            post("orders/close_position", params)
          end
        end
      end
    end
  end
end

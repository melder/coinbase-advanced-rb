module Coinbase
  module REST
    module Resources
      module Orders
        def create_order(client_order_id:, product_id:, side:, order_configuration:, **opts)
          endpoint = "#{Coinbase::API_PREFIX}/orders"
          post(
            endpoint,
            {
              client_order_id: client_order_id || SecureRandom.uuid_v4,
              product_id: product_id,
              side: side.upcase,
              order_configuration: order_configuration
            }.merge(opts)
          )
        end
      end
    end
  end
end

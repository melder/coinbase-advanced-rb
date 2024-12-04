# frozen_string_literal: true

require_relative "lib/coinbase"

key_file = ENV.fetch("COINBASE_JSON_KEY_FILE", nil)

# Coinbase::APIBase.new(key_file: key_file)
client = Coinbase::REST::RESTBase.new(key_file: key_file)

# res = client.get_products(product_type: "FUTURE", contract_expiry_type: "EXPIRING")
# pp res.response.products.map(&:product_id)

order_config = {
  market_market_ioc: {
    base_size: "1"
  }
}
# res = client.create_order(product_id: "BIT-27DEC24-CDE", order_configuration: order_config, side: "sell", leverage: "5")
# pp res.inspect

pp client.list_futures_positions.inspect

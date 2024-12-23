# frozen_string_literal: true

require_relative "lib/coinbase/advanced"

# first export COINBASE_JSON_KEY_FILE=absolute_key_file_path
key_file = ENV.fetch("COINBASE_JSON_KEY_FILE", nil)

client = Coinbase::Advanced::REST::RESTBase.new(key_file: key_file)

# Testing stuff

res = client.product("BIT-27DEC24-CDE")&.response
pp res

# pp client.public_product_book(product_id: "BTC-USD")

# res = client.get_products(product_type: "FUTURE", contract_expiry_type: "EXPIRING")
# pp res.response.products.map(&:product_id)

# order_config = {
#   market_market_ioc: {
#     base_size: "1"
#   }
# }
# res = client.create_order(product_id: "BIT-27DEC24-CDE", order_configuration: order_config, side: "sell", leverage: "5")
# pp res.inspect

# pp client.list_futures_positions.inspect

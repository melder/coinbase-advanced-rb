# frozen_string_literal: true

require_relative "lib/coinbase"

key_file = ENV.fetch("COINBASE_JSON_KEY_FILE", nil)

# Coinbase::APIBase.new(key_file: key_file)
client = Coinbase::REST::RESTBase.new(key_file: key_file)

# res = rest_base.get_products({})
# res = rest_base.get_unix_time({})
# puts res.response.inspect
# puts res.response.epoch_seconds
# res = rest_base.list_futures_positions
# puts res.response.inspect

res = client.get_products(product_type: "FUTURE", contract_expiry_type: "EXPIRING")
pp res.response.products

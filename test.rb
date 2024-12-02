# frozen_string_literal: true

require_relative "lib/coinbase"

key_file = ENV.fetch("COINBASE_JSON_KEY_FILE", nil)

# Coinbase::APIBase.new(key_file: key_file)
rest_base = Coinbase::REST::RESTBase.new(key_file: key_file)

# res = rest_base.get_products({})
res = rest_base.get_unix_time({})
puts res.response.inspect
puts res.response.epoch_seconds

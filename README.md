# Coinbase Advanced API Ruby Wrapper (Unofficial)

Ruby wrapper for Coinbase Advanced API. **UNOFFICIAL** as the author is not employed or associated with Coinbase nor has this gem been vetted by Coinbase. 

https://docs.cdp.coinbase.com/advanced-trade/docs/welcome

**If you are an experienced ruby / SDK dev would highly appreciate any guidance, even a review would be highly appreciated as two heads are better than one**

## Caveats:

1. Only REST implemented - https://docs.cdp.coinbase.com/advanced-trade/reference
2. Not all endpoints fully tested
3. Some cleanup / refactoring scheduled
4. Need to implement some tests
5. Need to pepper in additional logging

Consider this wrapper in alpha / prototype stage. Publishing it despite lack of polish hoping it provides others some utility.

## Installation

```
gem install coinbase-advanced
```

or add to Gemfile:

```
gem "coinbase-advanced"
```

and run bundle install

## Configuration

Configuration settings + defaults

```ruby
# not recommended to hard code the following. use environment vars and ENV.fetch("ENV_VAR", nil) instead
Coinbase::Advanced.key_file = "absolute path to key file"  # default env var: COINBASE_JSON_KEY_FILE
Coinbase::Advanced.api_key = "your_api_key"                # default env var: COINBASE_API_KEY
Coinbase::Advanced.api_secret = "your_api_secret"          # default env var: COINBASE_API_SECRET

Coinbase::Advanced.base_url = "api.coinbase.com"
Coinbase::Advanced.api_prefix = "/api/v3/brokerage"

Coinbase::Advanced.timeout = 30

Coinbase::Advanced.logger = Logger.new($stdout)
Coinbase::Advanced.log_level = :info # :debug / :info / :warn / :error / :fatal
Coinbase::Advanced.log_filter_params = ["api_key", "api_secret"] # filters sensitive params from log / console

Coinbase::Advanced.verbose = false
```

## Examples

```ruby
require "coinbase/advanced"

# recommended to simply point to key file rather than exporting api key/secret individually
# first export COINBASE_JSON_KEY_FILE=absolute_key_file_path
Coinbase::Advanced.key_file = ENV.fetch("COINBASE_JSON_KEY_FILE", nil)

# uncomment for verbose mode
# Coinbase::Advanced.verbose = true
client = Coinbase::Advanced::REST::RESTBase.new

res = client.get_server_time
puts "Server time: #{res.iso}"

res = client.get_product(product_id: "BTC-USD")
puts "Product: #{res.product_id} - Price: #{res.price}"

res = client.list_fills(limit: "3")
res.fills.each_with_index do |fill, i|
  puts "Fill #{i + 1}\n#{fill.inspect}\n"
end

res = client.list_futures_positions
if res.positions.empty?
  puts "No positions"
else
  res.positions.each_with_index do |position, i|
    puts "Position #{i + 1}\n#{position.inspect}\n"
  end
end
```

## Contribution

Open issue or fork + submit PR. You know the drill

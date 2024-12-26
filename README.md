# Coinbase Advanced API Ruby SDK (Unofficial)

Ruby port of https://github.com/coinbase/coinbase-advanced-py/

** If you are an experienced ruby / SDK dev would highly appreciate any guidance, even a review would be highly appreciated as two heads are better than one **

** Still testing locally not yet published as gem **

## Caveats:

1. Starting with REST port
2. WebSocket not supported yet and won't be until REST is complete which could take a while
3. To speed up completion, I'm trying my best to keep the structure as similar as possible (directories, file names, classes, method signatures, order, etc) but will adhere to ruby gem convention / style first and foremost.
4. While in dev phase any major departures from the python SDK based on my personal preference (rather than convention) will be documented below ↓

### Personal architectural choices

* **jwt_generator.rb is stubbed out for now. JWT generation logic cotained in coinbase/rest/rest_base.rb.** Reason being is I'm in the process of reading the JWT RFC and don't see a need to generalize / modularize it while focusing on REST. Added to TODO

### Configuration

Example config + defaults

```ruby
Coinbase::Advanced::Configuration.new.setup do |config|
  ### not recommended to hard code the following. use environment vars and ENV.fetch(ENV_VAR, nil) instead
  config.key_file = "absolute path to key file"  # default env var: COINBASE_JSON_KEY_FILE
  config.api_key = "your_api_key"                # default env var: COINBASE_API_KEY
  config.api_secret = "your_api_secret"          # default env var:COINBASE_API_SECRET
  ###

  config.base_url = "api.coinbase.com"
  config.api_prefix = "/api/v3/brokerage"
  config.timeout = 30
  config.verbose = false
  config.logger = Logger.new($stdout)
  config.log_level = :info # :debug / :info / :warn / :error / :fatal
  config.log_filter_params = ["api_key", "api_secret"] # filters sensitive params from log / console
end
```

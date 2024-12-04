module CoinbaseAdvanced
  module REST
    module Resources
      module Futures
        def list_futures_positions
          endpoint = "#{CoinbaseAdvanced::API_PREFIX}/cfm/positions"
          get(endpoint)
        end
      end
    end
  end
end

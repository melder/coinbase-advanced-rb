module Coinbase
  module REST
    module Resources
      module Futures
        def list_futures_positions
          endpoint = "#{Coinbase::API_PREFIX}/cfm/positions"
          get(endpoint)
        end
      end
    end
  end
end

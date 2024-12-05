# frozen_string_literal: true

module Coinbase
  module Advanced
    module REST
      module Resources
        module Futures
          def list_futures_positions
            endpoint = "#{Coinbase::Advanced::API_PREFIX}/cfm/positions"
            get(endpoint)
          end
        end
      end
    end
  end
end

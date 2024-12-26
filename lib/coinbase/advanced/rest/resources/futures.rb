# frozen_string_literal: true

module Coinbase
  module Advanced
    module REST
      module Resources
        module Futures
          def list_futures_positions
            get("cfm/positions")
          end
        end
      end
    end
  end
end

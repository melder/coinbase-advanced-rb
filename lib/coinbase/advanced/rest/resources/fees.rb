# frozen_string_literal: true

module Coinbase
  module Advanced
    module REST
      module Resources
        module Fees
          def get_transaction_summary(params = {})
            get("transaction_summary", params)
          end
        end
      end
    end
  end
end

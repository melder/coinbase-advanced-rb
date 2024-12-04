# frozen_string_literal: true

module CoinbaseAdvanced
  module REST
    module Resources
      module Public
        def get_unix_time(params = {})
          endpoint = "#{CoinbaseAdvanced::API_PREFIX}/time"
          get(endpoint, params, auth_required: false)
        end
      end
    end
  end
end

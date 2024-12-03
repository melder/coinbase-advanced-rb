# frozen_string_literal: true

module Coinbase
  module REST
    module Resources
      module Public
        def get_unix_time(params = {})
          endpoint = "#{Coinbase::API_PREFIX}/time"
          get(endpoint, params, auth_required: false)
        end
      end
    end
  end
end

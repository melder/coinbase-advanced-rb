# frozen_string_literal: true

module Coinbase
  module Advanced
    module REST
      module Resources
        module Public
          def get_unix_time(params = {})
            endpoint = "#{Coinbase::Advanced::API_PREFIX}/time"
            get(endpoint, params, auth_required: false)
          end
        end
      end
    end
  end
end

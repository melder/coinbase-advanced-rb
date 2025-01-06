# frozen_string_literal: true

module Coinbase
  module Advanced
    module REST
      module Resources
        module DataAPI
          def get_api_key_permissions # rubocop:disable Naming/AccessorMethodName
            get("key_permissions")
          end
        end
      end
    end
  end
end

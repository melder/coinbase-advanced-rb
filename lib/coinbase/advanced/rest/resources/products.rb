# frozen_string_literal: true

module Coinbase
  module Advanced
    module REST
      module Resources
        module Products
          def get_products(params = {})
            endpoint = "#{Coinbase::Advanced::API_PREFIX}/products"
            get(endpoint, params)
          end

          def list_products(params = {})
            endpoint = "#{Coinbase::Advanced::API_PREFIX}/products"
            get(endpoint, params)
          end
        end
      end
    end
  end
end
# class ListProductsResponse < BaseResponse
#   def initialize()
# end

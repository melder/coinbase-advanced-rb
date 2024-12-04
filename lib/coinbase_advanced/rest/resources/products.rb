# frozen_string_literal: true

module CoinbaseAdvanced
  module REST
    module Resources
      module Products
        def get_products(params = {})
          endpoint = "#{CoinbaseAdvanced::API_PREFIX}/products"
          get(endpoint, params)
        end

        def list_products(params = {})
          endpoint = "#{CoinbaseAdvanced::API_PREFIX}/products"
          get(endpoint, params)
        end
      end
    end
  end
end

# class ListProductsResponse < BaseResponse
#   def initialize()
# end

# frozen_string_literal: true

module Coinbase
  module REST
    module Products
      def get_products(params = {})
        endpoint = "#{Coinbase::API_PREFIX}/products"
        get(endpoint, params)
      end
    end
  end
end

# class ListProductsResponse < BaseResponse
#   def initialize()
# end

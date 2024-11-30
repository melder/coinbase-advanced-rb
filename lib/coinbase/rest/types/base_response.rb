# frozen_string_literal: true

module Coinbase
  module REST
    class BaseResponse
      def initialize(**kwargs)
        OpenStruct.new(kwargs)
      end
    end
  end
end

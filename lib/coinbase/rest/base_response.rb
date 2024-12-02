# frozen_string_literal: true

require "active_support/inflector"

module Coinbase
  module REST
    # Essentially converts JSON object to Ruby-style object
    # Similar to https://github.com/coinbase/coinbase-advanced-py/blob/v1.8.1/coinbase/rest/types/base_response.py
    class BaseResponse
      attr_reader :response

      # TODO: should snake case default should be true or false? (or perhaps support both via aliasing if possible?)
      def initialize(json_hash, snake_case: true)
        @snake_case = snake_case
        @response = to_data(json_hash)
      end

      def to_data(value)
        case value
        when Hash
          transformed_keys = value.keys.map { |key| @snake_case ? key.underscore.to_sym : key }
          transformed_values = value.values.map { |v| to_data(v) }

          Data.define(*transformed_keys).new(*transformed_values)
        when Array
          value.map { |v| to_data(v) }
        else
          value
        end
      end
    end
  end
end

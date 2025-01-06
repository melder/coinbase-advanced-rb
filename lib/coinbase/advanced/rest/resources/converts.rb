module Coinbase
  module Advanced
    module REST
      module Resources
        module Converts
          def create_convert_quote(params = {})
            raise ArgumentError, "Missing :from_account" unless params.key? :from_account
            raise ArgumentError, "Missing :to_account" unless params.key? :to_account
            raise ArgumentError, "Missing :amount" unless params.key? :amount

            post("convert/quote", params)
          end

          def get_convert_trade(params = {})
            raise ArgumentError, "Missing :trade_id" unless params.key? :trade_id
            raise ArgumentError, "Missing :from_account" unless params.key? :from_account
            raise ArgumentError, "Missing :to_account" unless params.key? :to_account

            trade_id = params.delete(:trade_id)
            get("convert/trade/#{trade_id}", params)
          end

          def commit_convert_trade(params = {})
            raise ArgumentError, "Missing :trade_id" unless params.key? :trade_id
            raise ArgumentError, "Missing :from_account" unless params.key? :from_account
            raise ArgumentError, "Missing :to_account" unless params.key? :to_account

            trade_id = params.delete(:trade_id)
            post("convert/trade/#{trade_id}", params)
          end
        end
      end
    end
  end
end

module Coinbase
  module Advanced
    module REST
      module Resources
        module Portfolios
          def list_portfolios(params = {})
            get("portfolios", params)
          end

          def create_portfolio(params = {})
            raise ArgumentError, "Missing :name" unless params.key? :name

            post("portfolios", params)
          end

          def move_portfolio_funds(params = {})
            raise ArgumentError, "Missing :funds" unless params.key? :funds
            raise ArgumentError, "Missing :funds[:value]" unless params[:funds].key? :value
            raise ArgumentError, "Missing :funds[:currency]" unless params[:funds].key? :currency
            raise ArgumentError, "Missing :source_portfolio_uuid" unless params.key? :source_portfolio_uuid
            raise ArgumentError, "Missing :target_portfolio_uuid" unless params.key? :target_portfolio_uuid

            post("portfolios/move_funds", params)
          end

          def get_portfolio_funds(params = {})
            raise ArgumentError, "Missing :portfolio_uuid" unless params.key? :portfolio_uuid

            portfolio_uuid = params.delete(:portfolio_uuid)
            get("portfolios/#{portfolio_uuid}", params)
          end

          def delete_portfolio(params = {})
            raise ArgumentError, "Missing :portfolio_uuid" unless params.key? :portfolio_uuid

            delete("portfolios/#{params[:portfolio_uuid]}")
          end

          def edit_portfolio(params = {})
            raise ArgumentError, "Missing :portfolio_uuid" unless params.key? :portfolio_uuid
            raise ArgumentError, "Missing :name" unless params.key? :name

            portfolio_uuid = params.delete(:portfolio_uuid)
            put("portfolios/#{portfolio_uuid}", params)
          end
        end
      end
    end
  end
end

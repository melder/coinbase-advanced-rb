# frozen_string_literal: true

module Coinbase
  module Advanced
    module REST
      module Resources
        module Perpetuals
          def allocate_portfolio(params = {})
            raise ArgumentError, "Missing :portfolio_uuid" unless params.key? :portfolio_uuid
            raise ArgumentError, "Missing :symbol" unless params.key? :symbol
            raise ArgumentError, "Missing :amount" unless params.key? :amount
            raise ArgumentError, "Missing :currency" unless params.key? :currency

            post("intx/allocate", params)
          end

          def get_perpetuals_portfolio_summary(params = {})
            raise ArgumentError, "Missing :portfolio_uuid" unless params.key? :portfolio_uuid

            get("intx/portfolio/#{params[:portfolio_uuid]}")
          end

          def list_perpetuals_positions(params = {})
            raise ArgumentError, "Missing :portfolio_uuid" unless params.key? :portfolio_uuid

            get("intx/positions/#{params[:portfolio_uuid]}")
          end

          def get_perpetuals_position(params = {})
            raise ArgumentError, "Missing :portfolio_uuid" unless params.key? :portfolio_uuid
            raise ArgumentError, "Missing :symbol" unless params.key? :symbol

            get("intx/positions/#{params[:portfolio_uuid]}/#{params[:symbol]}")
          end

          def get_portfolios_balances(params = {})
            raise ArgumentError, "Missing :portfolio_uuid" unless params.key? :portfolio_uuid

            get("intx/balances/#{params[:portfolio_uuid]}")
          end

          def opt_in_or_out_of_multi_asset_collateral(params = {})
            post("intx/multi_asset_collateral", params)
          end
        end
      end
    end
  end
end

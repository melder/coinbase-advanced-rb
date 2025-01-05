# frozen_string_literal: true

module Coinbase
  module Advanced
    module REST
      module Resources
        module Futures
          def get_futures_balance_summary # rubocop:disable Naming/AccessorMethodName
            get("cfm/balance_summary")
          end

          def get_intraday_margin_setting # rubocop:disable Naming/AccessorMethodName
            get("cfm/intraday/margin_setting")
          end

          def set_intraday_margin_setting(params = {})
            post("cfm/intraday/margin_setting", params)
          end

          def get_current_margin_window(params = {})
            get("cfm/intraday/current_margin_window", params)
          end

          def list_futures_positions
            get("cfm/positions")
          end

          def get_futures_position(params = {})
            raise ArgumentError, "Missing :product_id" unless params.key? :product_id

            get("cfm/positions/#{params[:position_id]}")
          end

          def schedule_futures_sweep(params = {})
            post("cfm/sweeps/schedule", params)
          end

          def list_futures_sweeps
            get("cfm/sweeps")
          end

          def cancel_pending_futures_sweep
            delete("cfm/sweeps")
          end
        end
      end
    end
  end
end

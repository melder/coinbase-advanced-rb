module Coinbase
  module Advanced
    module REST
      module Resources
        module Accounts
          def list_accounts(params = {})
            get("accounts", params)
          end

          def get_account(params = {})
            raise ArgumentError, "Missing :account_uuid" unless params.key? :account_uuid

            get("accounts/#{params[:account_uuid]}")
          end
        end
      end
    end
  end
end

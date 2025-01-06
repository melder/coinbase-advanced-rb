module Coinbase
  module Advanced
    module REST
      module Resources
        module PaymentMethods
          def list_payment_methods
            get("/payment_methods")
          end

          def get_payment_method(params = {})
            raise ArgumentError, "Missing :payment_method_id" unless params.key? :payment_method_id

            get("payment_methods/#{params[:payment_method_id]}")
          end
        end
      end
    end
  end
end

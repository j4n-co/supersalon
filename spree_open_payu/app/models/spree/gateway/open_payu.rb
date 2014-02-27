require 'openpayu'
module Spree
  class Gateway::OpenPayu < Gateway
    preference :server, :string, default: 'sandbox'
    preference :pos_id, :string
    preference :MD5, :string
    preference :MD5_2, :string
    preference :pos_auth_key, :string, default: 'Mark'

    def supports?(source)
      true
    end

    def provider_class
      OpenPayU
    end

    def provider
      OpenPayU::Configuration.configure do |config|
        config.merchant_pos_id  = '8389534'
        config.signature_key    = '95873498573498573897fb42d'
        config.algorithm        = 'MD5' # MD5, SHA-1, SHA-256
        config.service_domain   = 'payu.com'
        config.protocol         = 'https'
        config.data_format      = 'json' # json, xml
        config.env              = 'secure'
        config.order_url        = 'http://localhost:3000/payu/order'
        config.notify_url       = 'http://localhost:3000/payu/notify'
        config.continue_url     = 'http://localhost:3000/payu/success'
      end

    end

    def auto_capture?
      true
    end

    def method_type
      'payu'
    end

    def purchase(amount, express_checkout, gateway_options={})
      pp_details_request = provider.build_get_express_checkout_details({
        :Token => express_checkout.token
      })
      pp_details_response = provider.get_express_checkout_details(pp_details_request)

      pp_request = provider.build_do_express_checkout_payment({
        :DoExpressCheckoutPaymentRequestDetails => {
          :PaymentAction => "Sale",
          :Token => express_checkout.token,
          :PayerID => express_checkout.payer_id,
          :PaymentDetails => pp_details_response.get_express_checkout_details_response_details.PaymentDetails
        }
      })

      pp_response = provider.do_express_checkout_payment(pp_request)
      if pp_response.success?
        # We need to store the transaction id for the future.
        # This is mainly so we can use it later on to refund the payment if the user wishes.
        transaction_id = pp_response.do_express_checkout_payment_response_details.payment_info.first.transaction_id
        express_checkout.update_column(:transaction_id, transaction_id)
        # This is rather hackish, required for payment/processing handle_response code.
        Class.new do
          def success?; true; end
          def authorization; nil; end
        end.new
      else
        class << pp_response
          def to_s
            errors.map(&:long_message).join(" ")
          end
        end
        pp_response
      end
    end


  end
end

#   payment.state = 'completed'
#   current_order.state = 'complete'

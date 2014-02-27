module Spree
  module PayU
    module Request
      class Base
        attr_reader :payload, :connection, :options, :gateway_options, :source

        API_ENDPOINT = '/payments-api/4.0/service.cgi'

        def initialize(connection, options)
          @connection      = connection
          @options         = options
          @gateway_options = options[:gateway_options]
          @source          = options[:source]
        end

        def payload
          common_payload.merge(transaction).to_xml(root: 'request', skip_instruct: true, skip_types: true)
        end

        def test?
          options[:test_mode]
        end

        def create
          Oj.load connection.post(API_ENDPOINT, payload).body
        end


        def transaction
          raise 'Not implemented'
        end

        def common_payload
          {
            language: options[:language],
            command:  'SUBMIT_TRANSACTION',
            isTest:   options[:test_mode],
            merchant:  {
                apiLogin: options[:api_login],
                apiKey: options[:api_key]
            }
          }
        end

        def signature
          to_be_encoded = "#{options[:api_key]}~#{options[:merchant_id]}~#{gateway_options[:order_id]}~#{options[:amount]}~#{gateway_options[:currency]}"
          Digest::MD5.hexdigest(to_be_encoded)
        end

        def order
          {
            referenceCode: gateway_options[:order_id],
            description: 'spree order',
            language: options[:language],
            signature: signature,
            additionalValues: additional_values,
            accountId: options[:account_id],
            buyer: ''
          }
        end

        def additional_values
          {
            entry: {
              string: 'TX_VALUE',
              additionalValue: {
                value: options[:amount],
                currency: gateway_options[:currency]
              }
            }
          }
        end
      end
    end
  end
end

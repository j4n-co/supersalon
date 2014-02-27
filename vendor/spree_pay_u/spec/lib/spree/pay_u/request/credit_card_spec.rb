require 'spec_helper'

describe Spree::PayU::Request::CreditCard do
  include_examples 'pay_u_request'

  let(:source) do
    double(Spree::CreditCard, number: '4111111111111111',
                              verification_value: '123',
                              cc_type: 'visa',
                              year: '2018',
                              month: '08')
  end

  describe '#transaction' do
    let(:expected_credit_card) do
      {
          number: '4111111111111111',
          securityCode: '123',
          expirationDate: "2018/08",
          name: 'APPROVED'
      }
    end

    specify { expect(subject.transaction[:transaction][:type]).to eq('AUTHORIZATION_AND_CAPTURE') }

    specify { expect(subject.transaction[:transaction][:creditCard]).to eq(expected_credit_card) }

    specify { expect(subject.transaction[:transaction][:paymentMethod]).to eq('VISA') }

  end
end
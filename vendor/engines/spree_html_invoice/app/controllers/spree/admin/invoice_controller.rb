module Spree
  module Admin
    class InvoiceController < Spree::BaseController
      def lasku
        template = params[:template]
        eval "@#{template} = true"
        @order = Spree::Order.find_by_number(params[:id])
        @adjustments = @order.adjustments.eligible.where('amount>?',0)
        render  template , :layout => false
      end
    end
  end
end

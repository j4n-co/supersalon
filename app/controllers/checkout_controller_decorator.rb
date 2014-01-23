Spree::CheckoutController.class_eval do

  before_filter :redirect_for_transferuj, :only => :update
  before_filter :redirect_for_payu, :only => :update

  private

  def redirect_for_transferuj
    return unless params[:state] == "payment"

    @payment_method = Spree::BillingIntegration.find_by_id(params[:order][:payments_attributes].first[:payment_method_id])

    if @payment_method.nil?
      @payment_method = Spree::PaymentMethod.find_by_id(params[:order][:payments_attributes].first[:payment_method_id])
    end

    if @payment_method && @payment_method.kind_of?(Spree::BillingIntegration::Transferuj)
      @order.update_attributes(object_params)
      redirect_to  transferuj_show_path(:order_id => @order.id, :payment_method_id => @payment_method.id) 
    end
  end


  def redirect_for_payu
    return unless params[:state] == "payment"

    @payment_method = Spree::BillingIntegration.find_by_id(params[:order][:payments_attributes].first[:payment_method_id])

    if @payment_method.nil?
      @payment_method = Spree::PaymentMethod.find_by_id(params[:order][:payments_attributes].first[:payment_method_id])
    end

    if @payment_method && @payment_method.kind_of?(Spree::BillingIntegration::Payu)
      @order.update_attributes(object_params)
      redirect_to  payu_show_path(:order_id => @order.id, :payment_method_id => @payment_method.id) 
    end
  end

end
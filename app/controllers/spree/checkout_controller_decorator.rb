Spree::CheckoutController.class_eval do

  before_filter :redirect_for_transferuj, :only => :update
  before_filter :redirect_for_payu, :only => :update


  # Updates the order and advances to the next state (when possible.)
  def update
    if @order.update_attributes(object_params)
      persist_user_address

      unless @order.next
        flash[:error] = @order.errors.full_messages.join("\n")
        redirect_to checkout_state_path(@order.state) and return
      end

      if @order.completed?
        session[:order_id] = nil
        flash.notice = Spree.t(:order_processed_successfully)
        flash[:commerce_tracking] = "nothing special"
        redirect_to completion_route
      else

        #ajax delivery update
        if params[:remote]
          render :partial => 'delivery_order_summary', :locals => { :order => @order }
        else 
          redirect_to checkout_state_path(@order.state)
        end

      end
    else
      render :edit
    end
  end

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

    if @payment_method && @payment_method.kind_of?(Spree::BillingIntegration::PayU)
      @order.update_attributes(object_params)
      redirect_to payu_create_order_path(:order_id => @order.id, :payment_method_id => @payment_method.id) 
    end
  end

end
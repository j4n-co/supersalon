class TransferujController < Spree::BaseController
  skip_before_filter :verify_authenticity_token, :only => [:comeback, :comeback_s2s]
  
  def show
    
    if params[:payment_method_id] and Spree::BillingIntegration.exists? params[:payment_method_id]
      @transferuj = Spree::BillingIntegration.find params[:payment_method_id]
    else
      flash[:error] = "oops, it looks like Billing Integration no.#{params[:payment_method_id]} does not exist!"
      redirect_to checkout_state_url(:payment)
    end

    #@shop_login
    @server = @transferuj.preferences[:server]
    @account_id = @transferuj.preferences[:account_id]
    if params[:order_id] and Spree::Order.exists?(params[:order_id])
      @order = Spree::Order.find(params[:order_id])
    else
      flash[:error] = "oops, the order id=#{params[:order_id]} doesn't exist!"
      redirect_to checkout_state_url(:payment)
    end
    
    #you'll need to create an md5 hash of these params
    #MD5(id + kwota + crc + kod bezpieczeństwa)
    @md5sum = Digest::MD5.hexdigest(@account_id.to_s+@order.total.to_s+@order.number.to_s)
    
    @transaction_data = {
      :id => @account_id,
      :kwota => @order.total.to_s,        
      :opis => 'Super Salon',
      :crc => @order.number,
      #:md5sum => @md5sum,
      :email => @order.email,
      :nazwisko => @order.bill_address.last_name,
      :imie => @order.bill_address.first_name,
      :adres => @order.bill_address.address1 + @order.bill_address.address2, 
      :miasto => @order.bill_address.city,
      :kod => @order.bill_address.zipcode,
      :kraj => @order.bill_address.country.name,
      :telefon => @order.bill_address.phone, 
      :wyn_url => "http://sandbox.dev:3000/transferuj/success",
      :pow_url => "http://sandbox.dev:3000/transferuj/success",
      :pow_url_blad => "http://sandbox.dev:3000/transferuj/error"
    }

    redirect_to @server+"?"+@transaction_data.to_query
  end
  
  def success
    @order = params[:tr_crc] ? Spree::Order.find_by_id(params[:tr_crc]) : Spree::Order.find_by_id( session[:order_id] ) 
    #@order.payment.complete
    #@order.next
    #order.save
    #session[:order_id] = nil
    render text: "true"
  end
  
  def comeback_s2s
    @a = params[:a]
    @b = params[:b]
    @server = params[:server]
    @server ||= "live"
    c = GestPay::CryptRequest.new(@a, @server)
    t = c.decrypt(@b)
    logger.info "***GESTPAY***S2S*** Data in comeback_s2s: #{params} #{t} #{@order}"
    if t[:shop_transaction_id] and Order.find_by_number t[:shop_transaction_id]  
      logger.info "***GESTPAY***S2S*** comeback_s2s: #{t.inspect}"
      @order = Order.find_by_number t[:shop_transaction_id]  
      logger.info "***GESTPAY***S2S*** comeback_s2s: #{@order.inspect} #{@order.payment.inspect}"
      @order.payment.started_processing  
      logger.info "***GESTPAY***S2S*** comeback_s2s: #{@order.payment.inspect}"
      case t[:transaction_result]
        when "XX" # Esito transazione sospeso (pagamento tramite bonifico)
          @order.payment.pend
        when "OK" # Esito transazione positivo
          @order.payment.complete
        when "KO" # Esito transazione negativo
          @order.payment.fail
        else # Esito transazione indefinito
          logger.info "***GESTPAY***S2S*** Esito transazione indefinito - comeback_s2s: #{params} #{t} #{@order}"
      end      
      logger.info "***GESTPAY***S2S*** comeback_s2s: #{@order.payment.inspect}"
    else
      raise "ERRORE, parametro ':shop_transaction_id' errato o assente, l'ordine number=#{t[:shop_transaction_id]} non esiste !"
    end
  end
  
end
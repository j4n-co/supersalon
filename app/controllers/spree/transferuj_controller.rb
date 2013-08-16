class Spree::TransferujController < Spree::BaseController
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
    #MD5(id + kwota + crc + kod bezpieczenstwa)
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
      :wyn_url => transferuj_success_url,
      :pow_url => order_url(@order.number),
      :pow_url_blad => transferuj_error_url
    }

    redirect_to @server+"?"+@transaction_data.to_query
  end
  
  def success
    @order = params[:tr_crc] ? Spree::Order.find_by_number(params[:tr_crc])[0] : Spree::Order.find_by_number('R724374460')
    @sample = {"id"=>"10169", "tr_id"=>"TR-L57-TST23X", "tr_date"=>"2013-08-05 14:34:50", "tr_crc"=>"R724374460", "tr_amount"=>"15.00", "tr_paid"=>"15.00", "tr_desc"=>"test description", "tr_status"=>"TRUE", "tr_error"=>"none", "tr_email"=>"jan.drewniak@gmail.com", "md5sum"=>"e1a0e1a084b7a25d4e57c21ed6fac1c0", "controller"=>"spree/transferuj", "action"=>"success"}
    
    if params[:tr_error] == 'none' && @order

      if params[:tr_paid] == params[:tr_amount]
        @order.finalize!
        @order.state = 'complete'
        @order.payment_total = params[:tr_paid]
        @order.payment_state = 'paid'
        @order.save!
        session[:order_id] = nil
      end

    end
    render text: "TRUE"
  end
  
  def comeback_s2s
    @a = params[:a]
    @b = params[:b]
    @server = params[:server]
    @server ||= "live"
    #c = GestPay::CryptRequest.new(@a, @server)
    t = c.decrypt(@b)
    if t[:shop_transaction_id] and Order.find_by_number t[:shop_transaction_id]  
      @order = Order.find_by_number t[:shop_transaction_id]  
      @order.payment.started_processing  
      case t[:transaction_result]
        when "XX"
          @order.payment.pend
        when "OK" 
          @order.payment.complete
        when "KO" 
          @order.payment.fail
        else 
      end      
    else
      raise "ERRORE, parametro ':shop_transaction_id' errato o assente, l'ordine number=#{t[:shop_transaction_id]} non esiste !"
    end
  end
  
end
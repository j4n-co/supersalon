class Spree::PayuController < Spree::BaseController
  #include Payu::Helpers
  
  skip_before_filter :verify_authenticity_token
  
  def create_order
    new_order_url = "https://www.platnosci.pl/paygw/UTF/NewPayment"
    @order = Spree::Order.find(params[:order_id])
    @payu = Spree::PaymentMethod.find(params[:payment_method_id]) 
    
    order = {
      merchant_pos_id: "8389534",
      customer_ip: request.remote_ip, # You can user request.remote_ip in your controller
      ext_order_id: 1342, #Order id in your system
      order_url: "http://localhost:3000/",
      description: "New order",
      currency_code: "PLN",
      total_amount: 10000,
      notify_url: "http://localhost:3000/",
      continue_url: "http://localhost:3000/",
      buyer: {
        email: 'dd@ddd.pl',
        phone: '123123123',
        first_name: 'Jan',
        last_name: 'Kowalski',
        language: 'pl_PL',
        delivery: {
          recipient_name: 'ummz',
          name: 'Kowal',
          street: 'Wiktorska 33/62',
          postal_code: '05-587',
          city: 'Warszawa',
          country_code: 'PL'
        }
      },
      products: [
        {
          name: 'Mouse',
          unit_price: 10000,
          quantity: 1
        }
      ],
      pay_methods: [
        {
          type: 'CARD_TOKEN',
          value: 'Token value'
        }
      ]#,
      #shipping_method: {
      #  country: 'PL',
      #  price: 'price',
      #  name: 'shipping name'
      #}
    }


    ts =  Time.now.to_i.to_s
    #sig = md5 (pos_id + session_id + value1 + value 2 + ... + valuen + ts + key )
    #binding.pry

    order = {
      pos_id: @payu.preferences[:pos_id],
      session_id: @order.payments.last.identifier, #first two params
      pos_auth_key: @payu.preferences[:pos_auth_key],
      amount: @order.total * 100,
      desc: 'Order from Super Salon', 
      order_id: @order.number,
      first_name: @order.billing_address.first_name,
      last_name: @order.billing_address.last_name,
      street: @order.billing_address.address1,
      city:@order.billing_address.city,
      post_code:@order.billing_address.zipcode,
      country:@order.billing_address.country.iso3,
      email:@order.email,
      phone:@order.billing_address.phone,
      client_ip: request.remote_ip.to_s,
      ts: Time.now.to_i.to_s #last param
    }

    @sig = Digest::MD5.hexdigest( order.values.flatten.join('') +  @payu.preferences[:key1].to_s)
    order[:sig] = @sig
    redirect_to new_order_url+"?"+order.to_query
  end
  
  def ok
    @order = Spree::Order.where(:number => params[:order_id]).first
    if @order.payments.last.state != 'completed'
      @order.state = 'complete'
      @order.payment_total = @order.total
      @order.payment_state = 'paid'
      @order.payments.last.complete!
      @order.finalize!
    end
    # successful redirect
    redirect_to order_path(@order)
  end

  def error
    @order = Spree::Order.where(:number => params[:order_id]).first
    # failed redirect
  end

  def report

    response = Payu['main'].get params[:session_id]

    if response.status == 'OK'
      order = Order.find(response.trans_order_id)

      if response.completed? && order.present?
        # mark order as paid
      else
        # payment not completed
      end
    end

    render :text => 'OK'
  end

  def provider
    self.provider
  end
end

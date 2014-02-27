class Spree::BillingIntegration::PayU  < Spree::BillingIntegration
  preference :pos_id, :string
  preference :pos_auth_key, :string
	preference :key1, :string
  preference :key2, :string
  preference :add_signature, :boolean

  def provider_class
    self.class
  end

  def payment_profiles_supported?
    false
  end
  def new
    binding.pry
  end
  private 

  def payment_method
    Spree::PaymentMethod.find(params[:payment_method_id])
  end

  def provider
    payment_method.provider
  end


end

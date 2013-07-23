class Spree::BillingIntegration::Transferuj  < Spree::BillingIntegration
  preference :account_id, :string
	
  attr_accessible :preferred_account_id, :preferred_ipn_notify_host, :preferred_success_url, 
    :preferred_encryption, :preferred_certificate_id, 
    :preferred_currency, :preferred_language,
    :preferred_server, :preferred_test_mode

  def provider_class
    self.class
  end

  def payment_profiles_supported?
    false
  end

end

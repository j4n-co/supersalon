class Spree::BillingIntegration::Payu  < Spree::BillingIntegration
  
  preference :pos_id, :string
  preference :MD5, :string
  preference :MD5_2, :string
  preference :pos_auth_key, :string


  attr_accessible :preferred_account_id, :preferred_ipn_notify_host, :preferred_success_url, 
    :preferred_encryption, :preferred_certificate_id, 
    :preferred_currency, :preferred_language,
    :preferred_server, :preferred_test_mode, 
    :preferred_pos_id,
    :preferred_MD5,
    :preferred_MD5_2,
    :preferred_pos_auth_key,



  def provider_class
    self.class
  end

  def payment_profiles_supported?
    false
  end

end
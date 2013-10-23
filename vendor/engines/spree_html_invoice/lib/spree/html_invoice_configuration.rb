module Spree
  class HtmlInvoiceConfiguration < Preferences::Configuration
    preference :html_invoice_logo_path, :string
    preference :html_receipt_logo_path, :string
    preference :html_receipt_info, :string
    preference :html_receipt_email, :string
    preference :print_buttons, :string, default: 'invoice'
    preference :suppress_anonymous_address, :boolean, :default => true
  end
end
OpenPayU::Configuration.configure do |config|
    config.merchant_pos_id  = '162621'
    config.signature_key    = '0a925ff8366330c5081d3408966bad3a'
    config.algorithm        = 'MD5' # MD5, SHA-1, SHA-256
    config.service_domain   = 'payu.pl'
    config.protocol         = 'https'
    config.data_format      = 'xml' # json, xml
    config.env              = 'secure'
    config.order_url        = 'http://localhost:3000/order'
    config.notify_url       = 'http://localhost:3000/notify'
    config.continue_url     = 'http://localhost:3000/success'
end
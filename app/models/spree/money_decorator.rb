# encoding: utf-8

Spree::Money.class_eval do

    def initialize(amount, options={})
      @money = self.class.parse([amount, (options[:currency] || Spree::Config[:currency])].join)
      @options = {}
      @options[:symbol] = false 
      @options[:with_currency] = Spree::Config[:display_currency]
      @options[:symbol_position] = Spree::Config[:currency_symbol_position].to_sym
      @options[:no_cents] = Spree::Config[:hide_cents]
      @options[:decimal_mark] = Spree::Config[:currency_decimal_mark]
      @options[:thousands_separator] = Spree::Config[:currency_thousands_separator]
      @options[:sign_before_symbol] = Spree::Config[:currency_sign_before_symbol]
      @options.merge!(options)
      # Must be a symbol because the Money gem doesn't do the conversion
      @options[:symbol_position] = @options[:symbol_position].to_sym
    end

end

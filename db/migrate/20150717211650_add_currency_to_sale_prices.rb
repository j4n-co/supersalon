class AddCurrencyToSalePrices < ActiveRecord::Migration
	def change
	  add_column :spree_sale_prices, :currency, :string
	end
end

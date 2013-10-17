class AddCurrencyToBanks < ActiveRecord::Migration
  def change
     add_column :spree_banks, :currency, :string
  end
end

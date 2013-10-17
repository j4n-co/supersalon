class AddNameAddressToBanks < ActiveRecord::Migration
  def change

    add_column :spree_banks, :person_name, :string
    add_column :spree_banks, :address, :string
  
  end
end

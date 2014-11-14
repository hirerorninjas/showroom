class AddPriceQuantityToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :price, :integer
  	add_column :products, :quantity, :integer
  end
end

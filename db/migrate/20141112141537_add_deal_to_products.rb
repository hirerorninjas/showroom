class AddDealToProducts < ActiveRecord::Migration
  def change
    add_column :products, :deal, :boolean, :default => false
  end
end

class AddDealerToUser < ActiveRecord::Migration
  def change
  	add_column :users, :dealer, :string, default: "dealer"
  end
end

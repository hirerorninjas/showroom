class AddDealerToUser < ActiveRecord::Migration
  def change
    add_column :users, :dealer, :boolean
  end
end

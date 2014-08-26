class AddPriceToShares < ActiveRecord::Migration
  def change
    add_column :shares, :price, :decimal
  end
end

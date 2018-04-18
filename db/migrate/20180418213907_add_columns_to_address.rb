class AddColumnsToAddress < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :mowing_price, :float
    add_column :addresses, :spraying_price, :float
  end
end

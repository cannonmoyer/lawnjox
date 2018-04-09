class AddSquareFeetColumnToAddress < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :square_feet, :integer
  end
end

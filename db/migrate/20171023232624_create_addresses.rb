class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.text :street
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end

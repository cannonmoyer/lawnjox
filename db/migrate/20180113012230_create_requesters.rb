class CreateRequesters < ActiveRecord::Migration[5.1]
  def change
    create_table :requesters do |t|
      t.text :ip
      t.text :cookie
      t.integer :count

      t.timestamps
    end
  end
end

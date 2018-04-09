class CreateQuotes < ActiveRecord::Migration[5.1]
  def change
    create_table :quotes do |t|
      t.string :name
      t.string :email
      t.string :address
      t.references :requester, foreign_key: true

      t.timestamps
    end
  end
end

class AddPhoneColumnToQuote < ActiveRecord::Migration[5.1]
  def change
    add_column :quotes, :phone, :string
  end
end

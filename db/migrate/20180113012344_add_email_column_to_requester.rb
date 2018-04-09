class AddEmailColumnToRequester < ActiveRecord::Migration[5.1]
  def change
    add_column :requesters, :email, :text
  end
end

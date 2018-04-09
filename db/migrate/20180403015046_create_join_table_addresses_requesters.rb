class CreateJoinTableAddressesRequesters < ActiveRecord::Migration[5.1]
  def change
    create_join_table :addresses, :requesters do |t|
      # t.index [:address_id, :requester_id]
      # t.index [:requester_id, :address_id]
    end
  end
end

class AddAccountIdsToTransfer < ActiveRecord::Migration
  def change
    add_column :transfers, :outgoing_account_id, :integer
    add_column :transfers, :incoming_account_id, :integer
  end
end

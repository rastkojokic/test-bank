class RenameTransferTypeToTransferType < ActiveRecord::Migration
  def change
    rename_column :transfers, :type, :transfer_type
  end
end

class AddBankIdToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :add_column, :string
    add_column :accounts, :bank_id, :integer
  end
end

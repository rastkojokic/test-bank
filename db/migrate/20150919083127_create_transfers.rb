class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.decimal :amount
      t.string :type

      t.timestamps null: false
    end
  end
end

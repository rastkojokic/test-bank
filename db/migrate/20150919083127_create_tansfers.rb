class CreateTansfers < ActiveRecord::Migration
  def change
    create_table :tansfers do |t|
      t.decimal :amount
      t.string :type

      t.timestamps null: false
    end
  end
end

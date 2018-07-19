class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.string :stock_id
      t.string :user_id
      t.integer :price
      t.integer :quantity
      t.timestamps
    end
  end
end

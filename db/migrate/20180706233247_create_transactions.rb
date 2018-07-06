class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :type
      t.integer :amount
      t.string :user_id
      t.string :transaction_id

      t.timestamps
    end
  end
end

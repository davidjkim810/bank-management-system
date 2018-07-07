class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :type_of_transaction
      t.integer :amount
      t.string :user_id
      t.string :account_id

      t.timestamps
    end
  end
end

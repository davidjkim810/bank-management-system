class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :type
      t.integer :balance
      t.string :user_id

      t.timestamps
    end
  end
end

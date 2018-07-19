class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.string :company_name
      t.integer :price

      t.timestamps
    end
  end
end

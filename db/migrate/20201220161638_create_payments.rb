class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.string :transaction_code
      t.references :shopping_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end

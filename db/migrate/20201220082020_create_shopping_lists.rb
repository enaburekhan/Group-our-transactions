class CreateShoppingLists < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_lists do |t|
      t.string :name
      t.integer :amount
      t.integer :author_id

      t.timestamps
    end
  end
end

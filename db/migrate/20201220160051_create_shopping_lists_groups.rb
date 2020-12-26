class CreateShoppingListsGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_lists_groups do |t|
      t.references :shopping_list, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.timestamps
    end
  end
end

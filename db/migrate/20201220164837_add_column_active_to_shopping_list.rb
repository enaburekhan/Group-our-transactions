class AddColumnActiveToShoppingList < ActiveRecord::Migration[6.0]
  def change
    add_column :shopping_lists, :active, :boolean
  end
end

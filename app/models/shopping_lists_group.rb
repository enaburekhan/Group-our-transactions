class ShoppingListsGroup < ApplicationRecord
  belongs_to :shopping_list
  belongs_to :group
end

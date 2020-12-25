class ShoppingListsGroup < ApplicationRecord
  belongs_to :shopping_list
  belongs_to :group

  scope :destroy_lst, -> { where(shopping_list_id: params[:id]).destroy_all }
end

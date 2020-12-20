module ShoppingListsHelper
  def total_amount_on_external(shopping_list)
    sum = 0
    shopping_list.each do |lst|
      sum += lst.amount
    end
    sum
  end
  
  private
  
  def set_shopping_list
    @shopping_list = ShoppingList.find(params[:id])
  end
  
  def set_group
    @group = Group.find(params[:id])
  end
  
  def shopping_list_params
    params.require(:shopping_list).permit(:name, :amount,
                                     groups_ids: %i[id icon])
  end    
end

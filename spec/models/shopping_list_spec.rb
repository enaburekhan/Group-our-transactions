require 'rails_helper'

RSpec.describe ShoppingList, type: :model do
  describe ' model test cases ' do
    fixtures :users
    fixtures :shopping_lists

    context 'validates field' do
      it 'name and amount must be valid' do
        expect(shopping_lists(:one)).to be_valid
      end
      it 'name must not be valid' do
        shopping_lists(:one).name = nil
        expect(shopping_lists(:one)).not_to be_valid
      end

      it 'amount must not be valid' do
        shopping_lists(:one).amount = nil
        expect(shopping_lists(:one)).not_to be_valid
      end

      it 'validates shopping_list already exists' do
        shopping_list_new = ShoppingList.new(name: 'shopping_list1', amount: 5, author_id: 1)
        shopping_list_new.valid?
        expect(shopping_list_new.errors[:name]).to include('Name already exists')
      end
    end

    context 'must include the message' do
      it 'length between 4 to 30 characters' do
        shopping_lists(:one).name = ''
        shopping_lists(:one).valid?
        expect(shopping_lists(:one).errors[:name]).to include('Name length must be between 4 to 30 characters')
      end
      it 'must be numeric' do
        shopping_lists(:one).amount = 'gffgf'
        shopping_lists(:one).valid?
        expect(shopping_lists(:one).errors[:amount]).to include('Amount must be numeric')
      end
    end
  end
end

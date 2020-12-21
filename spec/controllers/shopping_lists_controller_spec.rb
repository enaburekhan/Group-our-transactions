 require 'rails_helper'

 RSpec.describe ShoppingListsController, type: :controller do
  describe ' controller test cases ' do
    fixtures :shopping_lists
    fixtures :users
    fixtures :groups

    let(:user1) { users(:one) }
    let(:user2) { users(:two) }
    let(:user) { FactoryBot.create :user }
    let(:group1) { groups(:one) }
    let(:shopping_list1) { shopping_lists(:one) }

    before { log_in user }
    before { log_in user }
    before { log_in user2 }

    describe '#index' do
      subject { get :index }
      it 'render the template' do
        expect(subject).to render_template(:index)
        expect(subject).to render_template('index')
        expect(subject).to render_template('shopping_lists/index')
      end

      it 'does not render a different template' do
        expect(subject).not_to render_template('users/delete')
      end
    end

    describe '#create' do
      it 'redirects to shopping_lists_url' do
        new_shopping_list = FactoryBot.build :shopping_list
        post :create, params: {
          shopping_list: {
            id: new_shopping_list.id,
            name: new_shopping_list.name,
            amount: new_shopping_list.amount,
            group_ids: ['1']
          }
        }
        expect(response).to redirect_to shopping_lists_path
      end

      it 'redirects to new_shopping_list_url' do
        new_shopping_list = FactoryBot.create :shopping_list
        post :create, params: {
          shopping_list: {
            id: new_shopping_list.id,
            name: new_shopping_list.name,
            amount: new_shopping_list.amount,
            group_ids: ['1']
          }
        }
        expect(response).to redirect_to new_shopping_list_url
      end
    end

    describe '#update' do
      it 'updates the shopping_list and redirects shopping_lists_path' do
        new_shopping_list = shopping_lists(:one)
        patch :update, params: { shopping_list: { name: 'new_name', amount: 10, group_ids: { 1 => 1 } }, id: new_shopping_list.id }
        expect(response).to redirect_to shopping_lists_path
      end
      it 'updates the shopping_list and redirects edit_shopping_list_url' do
        new_shopping_list = shopping_lists(:one)
        patch :update, params: { shopping_list: { name: nil, amount: 10, group_ids: { 1 => 1 } }, id: new_shopping_list.id }
        expect(response).to redirect_to edit_shopping_list_url
      end

      it 'updates the shopping_list and redirects edit_shopping_list_url' do
        new_shopping_list = shopping_lists(:one)
        patch :update, params: {
          shopping_list: {
            name: 'new_name',
            amount: nil,
            group_ids: { 1 => 1 }
          },
          id: new_shopping_list.id
        }
        expect(response).to redirect_to edit_shopping_list_url
      end
    end

    describe '#checkout' do
      subject { get :checkout, params: { id: shopping_list1.id } }
      it 'render the template' do
        expect(subject).to render_template(:checkout)
      end
    end
  end
end

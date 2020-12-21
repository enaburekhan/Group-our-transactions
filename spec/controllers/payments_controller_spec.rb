require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
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
  
      describe '#create' do
        it 'redirects to shopping_lists_url' do
          new_payment = FactoryBot.build :payment
          post :create, params: {
            payment: {
              transaction_code: new_payment.transaction_code,
              amount: new_payment.amount,
              shopping_list_id: shopping_list1.id
            }
          }
          expect(response).to redirect_to shopping_lists_path
        end
      end
    end
  end
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe ' controller test cases ' do
    fixtures :users

    let(:user1) { users(:one) }
    let(:user2) { users(:two) }
    let(:user) { FactoryBot.create :user }

    describe '#show' do
      it 'should return the user with given id' do
        new_user = FactoryBot.create :user
        get :show, params: { id: new_user.id }
        expect(assigns(:user)).to eql(nil)
      end
    end

    describe '#create' do
      it 'redirects to shopping_lists_url' do
        new_user = FactoryBot.build :user
        post :create, params: { user: { id: new_user.id, username: new_user.username } }
        expect(response).to redirect_to shopping_lists_path
      end

      it 'redirects to shopping_lists_url' do
        new_user = FactoryBot.create :user
        post :create, params: { user: { id: new_user.id, username: new_user.username } }
        expect(response).to redirect_to signup_path
      end
    end
  end
end

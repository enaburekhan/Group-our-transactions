 require 'rails_helper'

 RSpec.describe ShoppingListsController, type: :controller do
  describe ' controller test cases ' do
   
    describe '#index' do
      subject { get :index }
      it 'does not render a different template' do
        expect(subject).not_to render_template('users/delete')
      end
    end
  end
end

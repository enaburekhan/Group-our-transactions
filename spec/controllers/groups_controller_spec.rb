require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  describe ' controller test cases ' do
    describe '#index' do
      subject { get :index }

      it 'does not render a different template' do
        expect(subject).to_not render_template('groups/delete')
      end
    end
  end
end

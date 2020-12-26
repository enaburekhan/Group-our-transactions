require 'rails_helper'

RSpec.describe 'shopping_lists/new', type: :view do
  fixtures :shopping_lists
  fixtures :groups

  before(:each) do
    @group = assign(:group, [groups(:one), groups(:two)])
    @group_added = assign(:group, [])
    @shopping_list = assign(:shopping_list, shopping_lists(:one))
  end

  it 'renders new shopping_list form' do
    render

    assert_select 'form[action=?][method=?]', shopping_list_path(@shopping_list), 'post' do
      assert_select 'input[name=?]', 'shopping_list[name]'

      assert_select 'input[name=?]', 'shopping_list[amount]'
    end
  end
end

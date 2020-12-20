require 'rails_helper'

RSpec.describe "shopping_lists/index", type: :view do
  before(:each) do
    assign(:shopping_lists, [
      ShoppingList.create!(
        name: "Name",
        amount: 2,
        author_id: 3
      ),
      ShoppingList.create!(
        name: "Name",
        amount: 2,
        author_id: 3
      )
    ])
  end

  it "renders a list of shopping_lists" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end

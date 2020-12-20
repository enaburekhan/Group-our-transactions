require 'rails_helper'

RSpec.describe "shopping_lists/new", type: :view do
  before(:each) do
    assign(:shopping_list, ShoppingList.new(
      name: "MyString",
      amount: 1,
      author_id: 1
    ))
  end

  it "renders new shopping_list form" do
    render

    assert_select "form[action=?][method=?]", shopping_lists_path, "post" do

      assert_select "input[name=?]", "shopping_list[name]"

      assert_select "input[name=?]", "shopping_list[amount]"

      assert_select "input[name=?]", "shopping_list[author_id]"
    end
  end
end

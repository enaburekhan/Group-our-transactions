FactoryBot.define do
  factory :payment do
    amount { 1 }
    transaction_code { "MyString" }
    shopping_list { nil }
  end
end

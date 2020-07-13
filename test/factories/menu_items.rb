FactoryBot.define do
  factory :menu_item do
    menu { nil }
    name { 'MyString' }
    description { 'MyText' }
    price_cents { 1 }
    currency { 'MyString' }
  end
end

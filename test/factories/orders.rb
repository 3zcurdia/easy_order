FactoryBot.define do
  factory :order do
    merchant
    total_cents { 10_00 }
    total_currency { 'MXN' }
  end
end

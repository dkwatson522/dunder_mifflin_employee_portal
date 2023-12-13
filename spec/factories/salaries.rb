FactoryBot.define do
  factory :salary do
    base_amount { 80000 }
    bonus_amount { [0, 5000, 10000, 15000].sample }
  end
end

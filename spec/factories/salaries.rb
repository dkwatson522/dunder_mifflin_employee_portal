# == Schema Information
#
# Table name: salaries
#
#  id           :bigint           not null, primary key
#  base_amount  :integer
#  bonus_amount :integer
#  status       :integer          default("inactive")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_salaries_on_user_id  (user_id)
#
FactoryBot.define do
  factory :salary do
    base_amount { Faker::Number.between(from:   50000, to: 110000) }
    bonus_amount { Faker::Number.between(from:   500, to: 10000) }
  end
end

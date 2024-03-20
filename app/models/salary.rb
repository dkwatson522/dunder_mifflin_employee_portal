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
class Salary < ApplicationRecord
  enum status: %i(inactive active pending)

  belongs_to :user

  def total_amount
    base_amount + bonus_amount
  end
end

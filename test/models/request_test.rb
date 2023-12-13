# == Schema Information
#
# Table name: requests
#
#  id              :bigint           not null, primary key
#  end_date        :string
#  is_approved     :boolean          default(FALSE)
#  number_of_hours :float
#  start_date      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_requests_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

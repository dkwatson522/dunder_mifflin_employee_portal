# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  department             :string
#  email                  :string           not null
#  encrypted_password     :string           default(""), not null
#  experience             :integer
#  image_url              :string
#  is_admin               :boolean          default(FALSE)
#  name                   :string
#  paid_time_off          :integer
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :string
#  salary                 :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  manager_id             :bigint
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_manager_id            (manager_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (manager_id => users.id)
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

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
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  belongs_to :manager, class_name: 'User', optional: true, inverse_of: :employees
  has_many :requests, dependent: :destroy
  has_many :employees, dependent: :destroy, class_name: 'User', foreign_key: 'manager_id', inverse_of: :manager
  # has_one :salary
  has_one_attached :avatar
end

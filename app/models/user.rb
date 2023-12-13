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

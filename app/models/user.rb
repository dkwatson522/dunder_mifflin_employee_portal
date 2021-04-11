class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :employees, dependent: :destroy, class_name: 'User', foreign_key: 'manager_id', inverse_of: :manager
  belongs_to :manager, class_name: 'User', optional: true, inverse_of: :employees
  has_many :requests
end

class User < ApplicationRecord
  has_secure_password
  
  has_many :employees, class_name: 'User', foreign_key: 'manager_id', inverse_of: :manager
  belongs_to :manager, class_name: 'User', optional: true, inverse_of: :employees
  has_many :requests
end

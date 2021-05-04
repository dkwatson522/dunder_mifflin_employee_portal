class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable


  has_many :employees, dependent: :destroy, class_name: 'User', foreign_key: 'manager_id', inverse_of: :manager
  has_one_attached :avatar
  belongs_to :manager, class_name: 'User', optional: true, inverse_of: :employees
  has_many :requests, dependent: :destroy

  # def serializable_hash(options=nil)
  #   super({
  #     only: [],
  #     methods: [:user_avatar_url]
  #   }.merge(options || {}))
  # end
  #
  # def user_avatar_url
  #   Rails.application.routes.url_helpers.url_for( user.avatar )
  # end
  # ...
end

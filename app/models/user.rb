class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :name, presence: true
  validates :password, presence: true, confirmation: true

  has_many :company_users, dependent: :destroy
end

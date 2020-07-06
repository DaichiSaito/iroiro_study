class Company < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true

  has_many :company_users, dependent: :destroy
end

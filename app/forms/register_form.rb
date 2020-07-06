class RegisterForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :user_name, :string
  attribute :user_email, :string
  attribute :user_password, :string
  attribute :user_password_confirmation, :string
  attribute :company_name, :string
  attribute :company_address, :string

  validates :user_name, presence: true
  validates :user_email, presence: true
  validates :user_password, presence: true, confirmation: true
  validates :user_password_confirmation, presence: true
  validates :company_name, presence: true
  validates :company_address, presence: true

  def save
    return false if invalid?

    ActiveRecord::Base.transaction do
      user = User.create!(name: user_name, email: user_email, password: user_password, password_confirmation: user_password_confirmation)
      company = Company.create!(name: company_name, address: company_address)
      CompanyUser.create!(user: user, company: company)
    end
  end
end

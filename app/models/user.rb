class User < ApplicationRecord
  has_secure_password

  has_many :projects, dependent: :destroy

  validates :email, :password, :password_confirmation, presence: true
end

class User < ApplicationRecord
  has_secure_password
  has_many :reservations, dependent: :destroy
  has_many :cars, dependent: :destroy

  validates :username, presence: true
  validates :email, uniqueness: true, presence: true
end

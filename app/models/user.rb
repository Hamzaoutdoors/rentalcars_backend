class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :cars, dependent: :destroy

  validates :username, presence: true
end

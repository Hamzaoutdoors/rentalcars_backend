class User < ApplicationRecord
  has_many :reservations
  has_many :cars

  validates :username, presence: true
end

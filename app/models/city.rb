class City < ApplicationRecord
  has_many :reservations

  validates :name, presence: true
end

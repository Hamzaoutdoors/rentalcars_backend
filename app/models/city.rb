class City < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
end

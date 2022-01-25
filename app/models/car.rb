class Car < ApplicationRecord
  has_one :reservation
  belongs_to :user
  has_one :description

  validates :name, presence: true
  validates :brand, presence: true
  validates :imgUrl, presence: true
end

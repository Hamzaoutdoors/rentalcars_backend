class Car < ApplicationRecord
  has_one :reservation, dependent: :destroy
  has_one :description, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates :brand, presence: true
  validates :imgUrl, presence: true
end

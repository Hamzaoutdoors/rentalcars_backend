class Reservation < ApplicationRecord
  belongs_to :car
  belongs_to :city
  belongs_to :user

  validates :date, presence: true
end

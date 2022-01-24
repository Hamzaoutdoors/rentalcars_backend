class Reservation < ApplicationRecord
  has_one :car
  belongs_to :city
  belongs_to :user
end

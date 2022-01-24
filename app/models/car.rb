class Car < ApplicationRecord
  belongs_to :reservation
  belongs_to :user
  has_one :description
end

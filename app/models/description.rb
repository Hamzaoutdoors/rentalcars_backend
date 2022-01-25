class Description < ApplicationRecord
  belongs_to :car

  validates :insurance_fee, presence: true
  validates :price_daily, presence: true
  validates :price_monthly, presence: true
end

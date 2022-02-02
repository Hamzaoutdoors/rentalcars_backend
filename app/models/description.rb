class Description < ApplicationRecord
  belongs_to :car

  validates :insurance_fee, presence: true
  validates :price_daily, numericality: { greater_than: 0}, presence: true
  validates :price_monthly, numericality: { greater_than: 0}, presence: true
  validates :color, presence: true
end

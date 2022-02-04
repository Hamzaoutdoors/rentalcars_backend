class CreateDescriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :descriptions do |t|
      t.decimal  :insurance_fee
      t.decimal :price_daily
      t.decimal :price_monthly
      t.string :color
      t.timestamps
    end
  end
end

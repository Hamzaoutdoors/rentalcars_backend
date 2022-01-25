class AddRefToDescription < ActiveRecord::Migration[6.1]
  def change
    add_reference :descriptions, :car, null: false, foreign_key: true
  end
end

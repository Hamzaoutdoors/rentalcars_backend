class AddRefToReservations < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservations, :user, null: false, foreign_key: true
    add_reference :reservations, :city, null: false, foreign_key: true
    add_reference :reservations, :car, null: false, foreign_key: true
  end
end

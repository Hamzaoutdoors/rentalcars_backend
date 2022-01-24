class AddRefToCars < ActiveRecord::Migration[6.1]
  def change
    add_reference :cars, :user, null: false, foreign_key: true
    add_reference :cars, :description, null: false, foreign_key: true
  end
end

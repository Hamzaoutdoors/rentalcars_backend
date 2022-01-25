class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :brand
      t.string :imgUrl

      t.timestamps
    end
  end
end

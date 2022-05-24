class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :price
      t.references :toy, null: false, foreign_key: true

      t.timestamps
    end
  end
end

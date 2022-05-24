class AddStartAtToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :start_at, :date
  end
end

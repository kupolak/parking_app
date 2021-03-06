class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :pickup_time
      t.datetime :return_time
      t.references :spot, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

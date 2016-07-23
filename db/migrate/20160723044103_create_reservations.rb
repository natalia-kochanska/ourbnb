class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id, null: false
      t.integer :listing_id, null: false
      t.date :checkin, null: false
      t.integer :nights, null: false

      t.timestamps null: false
    end
  end
end

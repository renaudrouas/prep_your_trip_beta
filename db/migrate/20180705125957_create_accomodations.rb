class CreateAccomodations < ActiveRecord::Migration[5.2]
  def change
    create_table :accomodations do |t|

    t.string "name"
    t.string "address"
    t.string "e_mail"
    t.string "phone_number"
    t.time "start_date"
    t.time "end_date"
    t.float "latitude"
    t.float "longitude"
    t.string "reservation_number"
    t.integer "kind", default: 0
    t.bigint "trip_id"

      t.timestamps
    end
  end
end

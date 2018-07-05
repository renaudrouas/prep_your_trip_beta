class CreateTravels < ActiveRecord::Migration[5.2]
  def change
    create_table :travels do |t|

      t.string :reservation_number
      t.string :compagny_name
      t.time :start_date
      t.time :end_date
      t.string :address_in
      t.string :address_out
      t.float :latin
      t.float :latout
      t.float :lngin
      t.float :lngout
      t.integer :mode
      t.string :ticket_file
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end

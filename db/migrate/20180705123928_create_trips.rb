class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :title
      t.string :destination
      t.float :latitude
      t.float :longitude
      t.time :start_date
      t.time :end_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

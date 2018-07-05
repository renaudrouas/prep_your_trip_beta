class CreateChecklists < ActiveRecord::Migration[5.2]
  def change
    create_table :checklists do |t|
    t.text "description"
    t.boolean "done", default: false
    t.string "title"
    t.time "completed_at"
    t.bigint "trip_id"
      t.timestamps
    end
  end
end

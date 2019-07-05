class CreateAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :attendees do |t|
      t.boolean :attending, default: false
      t.integer :guests, default: 0
      t.string :comment
      t.references :dinner, foreign_key: true
      t.references :membership, foreign_key: true

      t.timestamps
    end
  end
end

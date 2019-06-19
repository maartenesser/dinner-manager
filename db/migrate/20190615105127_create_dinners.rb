class CreateDinners < ActiveRecord::Migration[5.2]
  def change
    create_table :dinners do |t|
      t.string :name
      t.date :date
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end

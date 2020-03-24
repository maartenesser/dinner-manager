class RemoveDateOnDinner < ActiveRecord::Migration[5.2]
  def change
    remove_column :dinners, :date, :date
  end
end

class AddTimeToDinner < ActiveRecord::Migration[5.2]
  def change
    add_column :dinners, :datetime, :datetime
  end
end

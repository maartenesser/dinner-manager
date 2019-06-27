class AddUserIdToDinner < ActiveRecord::Migration[5.2]
  def change
    add_column :dinners, :organizer_id, :bigint
  end
end

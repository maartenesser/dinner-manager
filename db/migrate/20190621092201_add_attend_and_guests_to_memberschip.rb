class AddAttendAndGuestsToMemberschip < ActiveRecord::Migration[5.2]
  def change
    add_column :memberships, :attending, :boolean, default: false
    add_column :memberships, :guests, :int, default: 0
  end
end

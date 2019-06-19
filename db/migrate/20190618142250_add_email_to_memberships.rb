class AddEmailToMemberships < ActiveRecord::Migration[5.2]
  def change
    add_column :memberships, :email, :string
  end
end

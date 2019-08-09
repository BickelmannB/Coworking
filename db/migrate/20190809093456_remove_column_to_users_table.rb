class RemoveColumnToUsersTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :password_changed
  end
end

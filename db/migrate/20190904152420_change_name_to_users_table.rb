class ChangeNameToUsersTable < ActiveRecord::Migration[5.2]
  def change
        rename_column :users, :adress, :address
  end
end

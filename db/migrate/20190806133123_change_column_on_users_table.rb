class ChangeColumnOnUsersTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_changed, :datetime
  end
end

class AddLoggedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :already_logged, :boolean, default: false
  end
end

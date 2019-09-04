class AddAdressToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :adress, :string
  end
end

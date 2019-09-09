class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address_n, :integer
    add_column :users, :address_street, :string
    add_column :users, :address_zip, :integer
    remove_column :users, :address
  end
end

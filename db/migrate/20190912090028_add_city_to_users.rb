class AddCityToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address_city, :string
  end
end

class AddLatAndLongAndAddressToWorkplaces < ActiveRecord::Migration[5.2]
  def change
    add_column :workplaces, :latitude, :float
    add_column :workplaces, :longitude, :float
    add_column :workplaces, :address, :string
  end
end

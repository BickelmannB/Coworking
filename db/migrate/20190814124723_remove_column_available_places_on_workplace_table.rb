class RemoveColumnAvailablePlacesOnWorkplaceTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :workplaces, :available_places
  end
end

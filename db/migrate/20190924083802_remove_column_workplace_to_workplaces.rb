class RemoveColumnWorkplaceToWorkplaces < ActiveRecord::Migration[5.2]
  def change
    remove_column :workplaces, :workplace
  end
end

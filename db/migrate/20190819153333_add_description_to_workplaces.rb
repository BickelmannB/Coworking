class AddDescriptionToWorkplaces < ActiveRecord::Migration[5.2]
  def change
    add_column :workplaces, :description, :string
  end
end

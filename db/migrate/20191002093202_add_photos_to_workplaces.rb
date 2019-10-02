class AddPhotosToWorkplaces < ActiveRecord::Migration[5.2]
  def change
    add_column :workplaces, :photo2, :string
    add_column :workplaces, :photo3, :string
  end
end

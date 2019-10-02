class AddDefaultPhotosToWorkplaces < ActiveRecord::Migration[5.2]
  def change
    change_column :workplaces, :photo2, :string, default: "image/upload/v1569313569/tyutt0y5b9yykzxsx9ry.jpg"
    change_column :workplaces, :photo3, :string, default: "image/upload/v1569313569/tyutt0y5b9yykzxsx9ry.jpg"
  end
end

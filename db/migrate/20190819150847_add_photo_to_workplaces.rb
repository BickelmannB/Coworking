class AddPhotoToWorkplaces < ActiveRecord::Migration[5.2]
  def change
    add_column :workplaces, :photo, :string
  end
end

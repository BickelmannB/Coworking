class CreateWorkplaces < ActiveRecord::Migration[5.2]
  def change
    create_table :workplaces do |t|
      t.string :name
      t.integer :total_places
      t.integer :available_places
    end
  end
end

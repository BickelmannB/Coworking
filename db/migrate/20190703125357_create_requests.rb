class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.text :biography

      t.timestamps
    end
  end
end

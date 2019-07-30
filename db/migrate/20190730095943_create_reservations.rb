class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :workplaces, foreign_key: true
      t.datetime :starting_date
      t.datetime :ending_date
    end
  end
end

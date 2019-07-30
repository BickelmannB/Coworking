class DropUseridToReservations < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :user_id
  end
end

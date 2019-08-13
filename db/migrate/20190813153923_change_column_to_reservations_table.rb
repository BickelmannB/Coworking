class ChangeColumnToReservationsTable < ActiveRecord::Migration[5.2]
  def change
    change_column :reservations, :starting_date, :date
        change_column :reservations, :ending_date, :date
  end
end

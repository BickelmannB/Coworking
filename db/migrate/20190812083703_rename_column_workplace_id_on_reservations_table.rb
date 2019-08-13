class RenameColumnWorkplaceIdOnReservationsTable < ActiveRecord::Migration[5.2]
  def change
      rename_column :reservations, :workplaces_id, :workplace_id
  end
end

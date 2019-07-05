class AddStatutToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :statut, :string, :default => 'unconfirmed'
  end
end

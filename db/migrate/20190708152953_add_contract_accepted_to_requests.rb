class AddContractAcceptedToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :contract_accepted, :boolean, default: false
  end
end

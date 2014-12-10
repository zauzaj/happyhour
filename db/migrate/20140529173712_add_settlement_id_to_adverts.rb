class AddSettlementIdToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :settlement_id, :integer
  end
end

class AddActiveToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :active, :boolean, default: 1
  end
end

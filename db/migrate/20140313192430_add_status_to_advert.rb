class AddStatusToAdvert < ActiveRecord::Migration
  def change
    add_column :adverts, :status, :string
  end
end

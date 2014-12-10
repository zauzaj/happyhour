class RemoveUserIdFromSubscription < ActiveRecord::Migration
  def change
    remove_column :subscribes, :user_id, :integer
  end
end

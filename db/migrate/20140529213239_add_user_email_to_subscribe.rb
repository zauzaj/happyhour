class AddUserEmailToSubscribe < ActiveRecord::Migration
  def change
    add_column :subscribes, :email, :string
  end
end

class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.string :title
      t.text :description
      t.string :payment_method
      t.boolean :is_commentable
      t.string :address
      t.string :location
      t.string :phone_number

      t.timestamps
    end
  end
end

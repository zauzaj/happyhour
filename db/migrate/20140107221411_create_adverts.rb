class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.string :title
      t.text :description
      t.string :payment_method
      t.boolean :is_commentable

      t.timestamps
    end
  end
end

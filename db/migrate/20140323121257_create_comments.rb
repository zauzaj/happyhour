class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.string :owner
      t.integer :advert_id

      t.timestamps
    end
  end
end

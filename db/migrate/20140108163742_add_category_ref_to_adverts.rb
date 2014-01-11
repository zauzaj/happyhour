class AddCategoryRefToAdverts < ActiveRecord::Migration
  def change
    add_reference :adverts, :category, index: true
  end
end

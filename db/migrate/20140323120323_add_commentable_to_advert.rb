class AddCommentableToAdvert < ActiveRecord::Migration
  def change
    add_column :adverts, :commentable, :boolean
  end
end

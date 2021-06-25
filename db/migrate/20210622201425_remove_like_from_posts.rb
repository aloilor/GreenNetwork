class RemoveLikeFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :like, :integer
  end
end

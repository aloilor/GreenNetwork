class AddUserToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :user, foreign_key: true, null:false
  end
end

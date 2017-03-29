class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
   create_table :friendships, id: false do |t|
    t.references :user, foreign_key: true 
    t.integer :friend_user_id
   end
   add_foreign_key :friendships, :users, column: :friend_user_id
 end
end

class User < ApplicationRecord
  has_and_belongs_to_many :friends ,
  class_name: "User" ,join_table :friendships ,foreign_key:"user_id",association_foreign_key:"friend_user_id"
  has_many :groups
  has_many :orders
  has_many :order_details
  has_and_belongs_to_many :groups
end

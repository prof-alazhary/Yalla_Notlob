class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :friends
  has_many :groups
  has_many :orders
  has_many :order_details
  has_and_belongs_to_many :groups,
  #class_name: "User",join_table :friendships ,foreign_key:"user_id",association_foreign_key:"friend_user_id"
  class_name: "User",
  join_table:  :friendships,
  foreign_key: :user_id,
  association_foreign_key: :friend_user_id

end

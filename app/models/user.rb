  class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable
    devise :omniauthable, :omniauth_providers => [:facebook,:google_oauth2]
    has_and_belongs_to_many :oauth_credentials

    #mount avatar uploader
    mount_uploader :avatar, AvatarUploader

    def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
      end
    end
    # searchkick word_start: [:email, :name]
    has_many :orders
    has_many :order_details
    has_many :groups
    has_and_belongs_to_many :groups
    #class_name: "User",join_table :friendships ,foreign_key:"user_id",association_foreign_key:"friend_user_id"
    #has_and_belongs_to_many :friends,class_name: "User",join_table:  :friendships,foreign_key: :user_id,association_foreign_key: :friend_user_id
    has_many :friendships
    has_many :friends, :through => :friendships
    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
    has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  end

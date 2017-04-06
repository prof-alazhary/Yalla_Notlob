class Group < ApplicationRecord
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  belongs_to :user
  # has_and_belongs_to_many :users
  acts_as_followable
end

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details
  acts_as_followable
  mount_uploader :menu_img, MenuImgUploader

  # after_create_commit { notify }
  # private
  #
  # def notify
  #   msg = User.find(self.user_id).name + "has created an Order for " + self.meal + " from " + self.rest_name
  #   Notification.create(event: msg)
  # end
end

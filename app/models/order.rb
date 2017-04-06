class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details

    mount_uploader :menu_img, MenuImgUploader
end

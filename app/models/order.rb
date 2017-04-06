class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details

  mount_uploader :menu_img, MenuImgUploader

  after_create_commit { notify }
  private

  def notify
    Notification.create(event: "new Order")
  end
end

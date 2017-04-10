class HomeController < ApplicationController
  def index
    @notifications = Notification.all.reverse
  end
end

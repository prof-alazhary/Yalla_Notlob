class HomeController < ApplicationController
  def index
    puts 'Home'
    @notifications = Notification.all.reverse
  end
end

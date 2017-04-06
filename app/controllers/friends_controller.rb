class FriendsController < ApplicationController
  def index
  end
  def invite_friend
    @user=current_user
    @member = User.find_by email: params[:email]
    respond_to do |format|
      if @member!=nil and @user.friends.include? @member
          format.json { render json: @member.to_json }
      else
          format.json { render json: (params[:email]).to_json }
      end
    end
  end
end

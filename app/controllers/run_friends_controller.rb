class RunFriendsController < ApplicationController
  respond_to :js

  def create
    @user = User.find(params[:run_friend][:followed_id])
    current_user.follow(@user)
    respond_with @user
  end

  def destroy
    @user = User.find(params[:run_friend][:followed_id])
    current_user.unfollow(@user)
    respond_with @user
  end
end
